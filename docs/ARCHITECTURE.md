# Архитектура Корпоративного AI-портала

## Общее описание

Корпоративный AI-портал — это трёхуровневая система для предоставления сотрудникам доступа к различным AI моделям с контролем доступа, лимитами на использование и полной статистикой. Система разделена на фронтенд, удалённый прокси-сервер на VPS и облачную БД Supabase.

```
┌─────────────────────────────────┐
│   Браузер сотрудника            │
│   (React SPA на Vite)           │
│   Localhost:5173 или 192.168.x  │
└──────────────┬──────────────────┘
               │ HTTPS + Bearer JWT
               │
┌──────────────▼──────────────────────────────────┐
│   Удалённый Прокси-сервер (VPS)                │
│   185.200.179.0:3001 (Node.js + Express)      │
│   - Аутентификация JWT                         │
│   - Маршрутизация к AI провайдерам            │
│   - Логирование использования                 │
│   - Управление моделями                       │
└──────────────┬──────────────────────────────────┘
               │ Supabase API Key (service_role)
               │
       ┌───────┼───────┐
       │       │       │
  ┌────▼─┐ ┌──▼──┐ ┌──▼──────────┐
  │OpenAI│ │Gemini│ │ OpenRouter  │
  └──────┘ └──────┘ │ (400+ моделей)
                    └─────────────┘
                    
       ┌─────────────────────────┐
       │   Supabase (PostgreSQL) │
       │   - Пользователи        │
       │   - Модели              │
       │   - История чатов       │
       │   - Usage logs          │
       │   - Конфигурация        │
       └─────────────────────────┘
```

---

## 1. Фронтенд (React/TypeScript/Vite)

### Технологии
- **React 18.3** — UI фреймворк
- **TypeScript 5.8+** — Строгая типизация
- **Vite 7.0** — Сборщик и dev сервер
- **Ant Design 5.20+** — UI компоненты
- **Recharts 2.12+** — Графики статистики
- **TanStack Query** — Кэширование и синхронизация серверных данных
- **Zustand** — Управление состоянием (auth, chat)
- **React Router** — Маршрутизация

### Запуск
```bash
npm run dev
```
- **localhost:5173** — локальный запуск
- **192.168.8.38:5173** — доступ из внутренней сети
- Vite конфиг: `vite.config.ts` с proxy для `/api/*` → `http://185.200.179.0:3001`

### Архитектура (Feature-Sliced Design)
```
src/
├── app/              # Провайдеры, маршрутизация, тема
├── pages/            # Страницы (chat, admin, dashboard, login, signup)
├── widgets/          # Сложные UI блоки (header, sidebar, chat-window)
├── features/         # Бизнес-логика (auth, model-selector, chat-input)
├── entities/         # Бизнес-сущности и их API (chat, models, users, statistics)
├── shared/           # Общие утилиты, UI компоненты, типы
└── layout/           # Layout компоненты
```

### Ключевые страницы
1. **Login/Signup** — Аутентификация через Supabase Auth
2. **Chat (`/chat/:conversationId`)** — Основная страница общения с AI
3. **Dashboard** — Статистика использования (для админов)
4. **Admin (`/admin`)** — Управление пользователями, моделями, настройками

### State Management
- **Zustand (auth-store)** — текущий пользователь, сессия, профиль
- **Zustand (chat-store)** — активный чат, выбранная модель, история сообщений
- **TanStack Query** — серверные данные (статистика, модели, пользователи)

### Переменные окружения (`.env.local`)
```
VITE_SUPABASE_URL=https://lghcirjmgzragnkimltr.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGc...
```
⚠️ **ANON_KEY используется только в клиенте для доступа к публичным таблицам (auth)**

---

## 2. Удалённый Прокси-сервер (VPS)

### Технологии
- **Node.js 18+** — Runtime
- **Express 5.1** — Web сервер и middleware
- **Axios** — HTTP клиент для запросов к AI провайдерам
- **Supabase JS SDK** — Доступ к БД (с service_role ключом)
- **CORS** — Кросс-доменные запросы
- **pm2** — Управление процессами на VPS
- **Nginx** — Обратный прокси (опционально)

### IP и порт
- **IP:** 185.200.179.0
- **Порт:** 3001
- **URL:** http://185.200.179.0:3001

### Запуск
```bash
# Локальная разработка
npm run dev

# Production на VPS
npm run build
pm2 start dist/index.js --name corpai-proxy
```

### Переменные окружения (`proxy/.env`)
```
SUPABASE_URL=https://lghcirjmgzragnkimltr.supabase.co
SUPABASE_SERVICE_ROLE_KEY=eyJhbGc...  # ⚠️ Секретный ключ, ТОЛЬКО на сервере
PORT=3001
OPENAI_API_KEY=sk-...
GEMINI_API_KEY=AIza...
DEEPSEEK_API_KEY=sk-...
GROK_API_KEY=xai-...
OPENROUTER_API_KEY=sk-or-v1-...
```

### API Endpoints

#### 1. `/api/v1/chat` (POST)
Основной эндпоинт для отправки сообщений
```javascript
{
  model: "gpt-5",
  messages: [...],
  jwt: "user-token",
  conversationId: "uuid"  // null для новых чатов
}
```
- Аутентификация через JWT
- Сохранение сообщений в БД
- Логирование использования (usage_logs)
- Маршрутизация к прямому API или OpenRouter

#### 2. `/api/v1/models` (GET)
Список всех доступных моделей из таблицы `models`
```javascript
[
  { id: "gpt-5", name: "GPT-5", provider: "openai" },
  { id: "deepseek-chat", name: "DeepSeek Chat", provider: "deepseek" },
  ...
]
```

#### 3. `/api/v1/configured-models` (GET)
Список ID моделей из `model_routing_config`

#### 4. `/api/v1/model-routing` (GET/PUT)
Конфигурация маршрутизации каждой модели (использовать OpenRouter или прямой API)
```javascript
{
  model_id: "gpt-5",
  use_openrouter: true,
  openrouter_model_id: "openai/gpt-5"
}
```

#### 5. `/api/v1/openrouter-models` (GET)
Список моделей от OpenRouter (кэшируется на час)

#### 6. `/api/v1/settings` (GET/PUT)
Глобальные настройки портала (лимиты для новых пользователей)

### Логика маршрутизации

```
1. Клиент отправляет: model="gpt-5", messages=[...]
2. Прокси проверяет modelRoutingConfig["gpt-5"]
3. Если use_openrouter=true:
   - Использует OpenRouter API
   - Модель: openrouter_model_id (например "openai/gpt-5")
4. Если use_openrouter=false:
   - Использует прямой API провайдера
   - Модель: model (например "gpt-5")
5. Очищает сообщения (убирает поле id)
6. Отправляет запрос к провайдеру
7. Логирует использование (токены, статус)
8. Возвращает ответ клиенту
```

### Процесс инициализации

1. Загрузка переменных окружения (.env)
2. Инициализация Supabase клиента (service_role)
3. Загрузка конфигурации маршрутизации из БД
4. Регистрация всех Express маршрутов
5. Запуск сервера на порту 3001

---

## 3. База данных (Supabase)

### Таблицы

#### `users` (auth.users)
Встроенная таблица Supabase Auth

#### `user_profiles`
```sql
- id (uuid) — ссылка на auth.users
- email
- role ('user' | 'admin')
- daily_request_limit (количество запросов в день)
- created_at, updated_at
```

#### `models`
```sql
- id (uuid) PRIMARY KEY
- model_id (text) — текстовый ID (gpt-5, deepseek-chat и т.д.)
- display_name (text) — название для UI
- provider (text) — openai, deepseek, gemini, grok
- is_default_access (boolean) — автоматический доступ для новых пользователей
- created_at
```

#### `user_model_access`
```sql
- user_id (uuid) — ссылка на user_profiles
- model_id (uuid) — ссылка на models
- created_at
```
Контроль доступа: какие модели доступны каждому пользователю

#### `model_routing_config`
```sql
- model_id (text) PRIMARY KEY — текстовый ID модели
- use_openrouter (boolean) — использовать OpenRouter или прямой API
- openrouter_model_id (text) — ID модели в OpenRouter (например "openai/gpt-5")
- created_at, updated_at
```

#### `conversations`
```sql
- id (uuid) PRIMARY KEY
- user_id (uuid) — ссылка на пользователя
- title (text) — название чата
- created_at
```

#### `messages`
```sql
- id (uuid) PRIMARY KEY
- conversation_id (uuid) — ссылка на conversations
- user_id (uuid)
- role ('user' | 'assistant')
- content (text) — текст сообщения
- model (text) — какая модель использовалась
- token_count (integer)
- created_at
```

#### `usage_logs`
```sql
- id (uuid) PRIMARY KEY
- user_id (uuid)
- model (text) — ID модели
- prompt_tokens (integer)
- completion_tokens (integer)
- total_tokens (integer)
- status ('success' | 'error')
- message_id (uuid) — ссылка на messages (для связи)
- error_details (text)
- created_at
```

#### `settings`
```sql
- id (text) PRIMARY KEY = 'global'
- new_user_daily_request_limit (integer)
- created_at, updated_at
```

---

## 4. Безопасность

### JWT Аутентификация
1. Пользователь логинится через Supabase Auth (клиент)
2. Получает JWT токен
3. Передаёт его в заголовке `Authorization: Bearer <token>` каждому запросу
4. Прокси верифицирует токен через Supabase

### API Ключи
- **ANON_KEY** — в клиенте, публичный, ограниченные права
- **SERVICE_ROLE_KEY** — на прокси, секретный, полные права к БД

### Права доступа в БД
- Таблицы доступны через Supabase REST API с RLS политиками
- На прокси используется service_role для чтения конфигурации и логирования
- Клиент использует ANON_KEY только для аутентификации

---

## 5. Поток данных (Example: User sends message)

```
1. Клиент (React)
   → набирает сообщение "привет"
   → выбирает модель "gpt-5"
   → нажимает "отправить"

2. ChatStore (chat-store.ts)
   → вызывает sendAIRequest(model, messages, conversationId)
   → добавляет оптимистичное сообщение в UI

3. Proxy API (proxy-api.ts)
   → отправляет POST /api/v1/chat
   {
     model: "gpt-5",
     messages: [{role: "user", content: "привет"}],
     jwt: "eyJhbGc...",
     conversationId: null
   }

4. Прокси-сервер (proxy/src/index.ts)
   → верифицирует JWT
   → создаёт conversation (если new)
   → сохраняет user message в БД (messages)
   → получает message_id
   → проверяет modelRoutingConfig["gpt-5"]
   → (use_openrouter=false) → использует OpenAI API
   → отправляет запрос к OpenAI
   → получает ответ
   → сохраняет assistant message в БД
   → логирует использование в usage_logs
   → возвращает ответ клиенту

5. Клиент (React)
   → получает ответ
   → заменяет оптимистичное сообщение на реальное
   → обновляет историю чатов
   → инвалидирует кэш статистики (usage stats)

6. Admin видит в статистике (Dashboard)
   → новая запись в usage_logs
   → обновлённые графики использования
```

---

## 6. Development vs Production

### Local Development
```bash
# Terminal 1: Frontend
npm run dev          # localhost:5173 или 192.168.8.38:5173

# Terminal 2: Proxy (mock)
cd proxy && npm run dev  # localhost:3001

# Vite автоматически проксирует /api/* → http://localhost:3001
```

### Production (VPS)
```bash
# На VPS:
pm2 start dist/index.js --name corpai-proxy
# или
pm2 restart corpai-proxy

# Frontend: собрать и задеплоить (например на Nginx)
npm run build
# dist/ → публикуется на веб-сервер
```

### Переход с локального на VPS
1. Frontend: изменить vite.config.ts (target: 'http://185.200.179.0:3001')
2. Или использовать переменные окружения для динамической конфигурации

---

## 7. Управление процессами на VPS (pm2)

```bash
# Запустить
pm2 start dist/index.js --name corpai-proxy

# Перезапустить
pm2 restart corpai-proxy

# Остановить
pm2 stop corpai-proxy

# Удалить
pm2 delete corpai-proxy

# Просмотр логов
pm2 logs corpai-proxy
tail -f proxy.log

# Автозагрузка при перезагрузке системы
pm2 startup
pm2 save
```

---

## 8. Обновление кода на VPS

```bash
# На локальной машине
git push origin main

# На VPS
cd ~/corpaiportal
git fetch origin
git reset --hard origin/main

# Пересобрать прокси
cd proxy
npm install
npm run build

# Перезапустить
pm2 restart corpai-proxy

# Проверить логи
tail -f proxy.log
```

---

## 9. Масштабируемость и оптимизация

### Текущие ограничения
- Прокси работает в одном процессе
- Кэширование моделей OpenRouter (1 час)
- TanStack Query кэширует данные на клиенте

### Возможные улучшения
- Load balancer перед несколькими прокси
- Redis для кэширования
- Message queues (RabbitMQ) для асинхронной обработки
- CDN для статических файлов
- Database replication для высокой доступности

---

## 10. Troubleshooting

### Проблема: 403 Forbidden от Supabase
**Решение:** Проверить SUPABASE_SERVICE_ROLE_KEY на прокси, убедиться что он секретный, а не публичный ANON_KEY

### Проблема: Модели не загружаются в чат
**Решение:** Проверить:
1. Есть ли записи в таблице `models`
2. Есть ли записи в `user_model_access` для текущего пользователя
3. Работает ли прокси (`pm2 logs corpai-proxy`)

### Проблема: Сообщения не сохраняются в БД
**Решение:** Проверить:
1. JWT токен валиден (срок не истёк)
2. `SUPABASE_SERVICE_ROLE_KEY` на прокси верный
3. Таблица `messages` существует и доступна
4. Логи прокси на наличие ошибок

---

## Итоговая архитектура в одной диаграмме

```
┌─────────────────────────────────────────────────────────────┐
│                    Браузер пользователя                      │
│  React 18 + Vite dev server (5173 или 192.168.8.38:5173)   │
│  - Chat UI (Ant Design)                                     │
│  - Auth Store (Zustand)                                     │
│  - Chat Store (Zustand)                                     │
│  - TanStack Query (для серверных данных)                   │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTPS + Bearer JWT
                           │ /api/v1/chat, /api/v1/models
                           ▼
        ┌──────────────────────────────────────────┐
        │  Удалённый Прокси (Node.js + Express)   │
        │  IP: 185.200.179.0:3001                 │
        │  - JWT верификация                      │
        │  - Маршрутизация моделей                │
        │  - Сохранение сообщений                 │
        │  - Логирование использования            │
        └──────────────┬───────────────────────────┘
                       │ Service Role Key
    ┌──────────────────┼──────────────────┐
    │                  │                  │
    ▼                  ▼                  ▼
 OpenAI API        Gemini API       OpenRouter API
 DeepSeek API      Grok API         (400+ моделей)
    │                  │                  │
    └──────────────────┼──────────────────┘
                       │
                       ▼
        ┌──────────────────────────────┐
        │  Supabase (PostgreSQL)       │
        │  - Аутентификация            │
        │  - Модели и конфигурация    │
        │  - Истории чатов            │
        │  - Usage logs               │
        │  - Управление доступом      │
        └──────────────────────────────┘
```

---

**Последнее обновление:** октябрь 2025  
**Версия:** 1.0
