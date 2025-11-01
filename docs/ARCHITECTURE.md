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

#### 7. `/api/v1/admin/users` (GET/PUT) - Require Admin Role
Управление пользователями
```javascript
// GET /api/v1/admin/users
// Returns: User profiles with roles and limits

// PUT /api/v1/admin/users/:userId
// Body: { daily_request_limit, role, display_name }
```

#### 8. `/api/v1/admin/models` (POST/DELETE) - Require Admin Role
Управление моделями
```javascript
// POST /api/v1/admin/models
// Body: { model_id, display_name, openrouter_model_id, temperature, is_default_access, description }
// Inserts into: models + model_routing_config

// DELETE /api/v1/admin/models/:modelId
// Deletes from: model_routing_config → user_model_access → models

// PUT /api/v1/admin/models/:modelId/description
// Body: { description }

// PUT /api/v1/admin/models/:modelId/cost
// Body: { approximate_cost }
```

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

1. Загрузка переменных окружения (.env) — **FIRST**, перед всеми импортами
2. Инициализация Supabase клиента (service_role)
3. Предварительная загрузка критических данных:
   - Конфигурация маршрутизации моделей (`loadModelRoutingConfig()`)
   - Прайс-лист OpenRouter (`fetchOpenRouterPricing()`)
4. Инициализация Express приложения с middleware:
   - CORS конфигурация
   - Body parser middleware (10MB лимит)
   - General API rate limiter (100 req/15min per IP)
5. Регистрация маршрутов в порядке:
   - Публичные GET маршруты (models, settings)
   - Middleware аутентификации
   - Защищённые маршруты (chat, settings PUT)
   - Admin маршруты (users, models management)
6. Запуск сервера на порту 3001

### Модульная структура Прокси-сервера

```
proxy/src/
├── index.ts                    # Инициализация Express, маршруты
├── config/
│   ├── cors.ts                # CORS конфигурация
│   ├── limits.ts              # Таймауты, размеры, лимиты
│   └── aiProviders.ts         # Конфигурация AI провайдеров (OpenAI, Gemini и т.д.)
├── middleware/
│   ├── auth.ts                # JWT верификация (createAuthMiddleware, requireAdmin)
│   ├── rateLimiter.ts         # IP-based rate limiting (apiLimiter, chatLimiter)
│   └── validation.ts          # Zod schemas для входных данных
├── services/
│   ├── chatService.ts         # Business logic для chat эндпоинтов
│   └── costLimiterService.ts  # Cost tracking и rate limiting по стоимости
├── routes/v1/
│   ├── chat.ts                # POST /chat/stream эндпоинт (с валидацией)
│   ├── models.ts              # GET/PUT model routing эндпоинты
│   ├── admin.ts               # Админ операции (users, models CRUD)
│   └── settings.ts            # GET/PUT для глобальных настроек
├── types/
│   └── express.d.ts           # Express Request type extensions
└── utils/                      # Утилиты (при необходимости)
```

**Ключевые принципы:**
- Каждый файл < 500 строк кода
- Конфигурация отделена в `config/`
- Middleware в отдельных файлах
- Services для бизнес-логики
- Routes возвращают Router функции
- Все импорты environment variables в начале `index.ts`

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

### Rate Limiting & DoS Protection (Implemented)
- **IP-Based Rate Limiting**: `express-rate-limit` middleware
  - General API: 100 requests per 15 minutes per IP
  - Chat endpoint: 20 requests per minute per IP
- **Cost-Based Rate Limiting**: `CostLimiterService` class
  - Отслеживает стоимость запросов в час
  - Часовой лимит по умолчанию: $50
  - Проверка выполняется перед отправкой запроса к AI провайдеру

### Input Validation (Implemented)
- **Request Validation**: Zod schemas для всех API эндпоинтов
  - Все POST/PUT/DELETE запросы валидируются перед обработкой
  - Возвращает 400 Bad Request при ошибке валидации
- **Response Validation**: Zod schemas для ответов от AI провайдеров
  - `openAIResponseSchema` — для OpenAI-совместимых API
  - `geminiResponseSchema` — для Google Gemini

### Streaming Security (Implemented)
- **Stream Timeout**: 300 секунд для предотвращения зависаний
- **Error Handling**: Try-catch блоки в обработчиках событий потока
- **Connection Monitoring**: Timeout сбрасывается при каждом пакете данных

### Authentication Middleware (Implemented)
- **createAuthMiddleware**: Проверяет JWT токен перед доступом к защищенным эндпоинтам
- **requireAdmin**: Дополнительная проверка роли администратора
- **Bearer Token**: Заголовок `Authorization: Bearer <token>` обязателен

### Secrets Management
- **SUPABASE_SERVICE_ROLE_KEY** хранится ТОЛЬКО в `proxy/.env`, никогда в коде
- **AI Provider Keys** (OpenAI, Gemini, DeepSeek, Grok, OpenRouter) на сервере
- Переменные окружения не передаются в браузер

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

## 6. Среды развертывания (Environments)

В проекте существует два основных окружения: локальное для разработки и production на удаленном VPS.

### 1. Среда разработки (локально)

Предназначена для разработки и отладки фронтенда.

- **Запуск**: `npm run dev` запускает Vite dev-сервер.
- **Адрес**: `http://localhost:5173` (или `http://192.168.x.x:5173` для доступа из локальной сети).
- **Проксирование API**: Vite, согласно конфигурации в `vite.config.ts`, перенаправляет все запросы с `/api/*` напрямую на **удаленный** прокси-сервер (`http://185.200.179.0:3001`). Это позволяет вести разработку фронтенда, не запуская прокси-сервер локально.

```typescript
// vite.config.ts
// ...
server: {
  proxy: {
    '/api': {
      target: 'http://185.200.179.0:3001',
      changeOrigin: true,
    },
  },
},
// ...
```

### 2. Production-среда (VPS)

Полноценное боевое окружение, развернутое на удаленном сервере (VPS) по адресу **https://aihub.fvds.ru**.

#### Общая схема работы в Production:

```
┌─────────────────────────────────────────────────────────────┐
│                    Браузер пользователя                      │
│                (открывает https://aihub.fvds.ru)             │
└──────────────────────────┬──────────────────────────────────┘
                           │ HTTPS (порт 443)
                           │
┌──────────────────────────▼──────────────────────────────────┐
│                   VPS-сервер (185.200.179.0)                 │
│                                                             │
│ ┌─────────────────────────────────────────────────────────┐ │
│ │                  Nginx (веб-сервер)                     │ │
│ │  - Отдает статику React (index.html, js, css)           │ │
│ │  - Проксирует /api/* на http://localhost:3001           │ │
│ └──────────────────────────┬──────────────────────────────┘ │
│                            │ HTTP (внутри сервера)
│ ┌──────────────────────────▼──────────────────────────────┐ │
│ │      Прокси-сервер (Node.js, pm2, localhost:3001)       │ │
│ │         - Аутентификация, логика, роутинг               │ │
│ └──────────────────────────┬──────────────────────────────┘ │
│                            │ Service Role Key
└────────────────────────────┼─────────────────────────────────┘
                             │
                             ▼
              ┌──────────────────────────┐
              │  Supabase, OpenAI, etc.  │
              └──────────────────────────┘
```

#### Детали конфигурации сервера:

- **Пользователь**: Все сервисы (прокси, файлы сайта) работают от имени непривилегированного пользователя `wstil` для повышения безопасности.

- **Прокси-сервер (Node.js)**:
    - Расположение: `/var/www/wstil/data/corpaiportal/proxy` (в директории пользователя `wstil`).
    - Запуск: Управляется через `pm2` от имени пользователя `wstil`.
    - Команда запуска: `pm2 start dist/index.js --name corpai-proxy`.

- **Фронтенд (статические файлы)**:
    - Исходный проект: `/var/www/wstil/data/corpaiportal/`
    - Собранные файлы: `/var/www/wstil/data/corpaiportal/dist/`
    - Развернутые файлы для веб-сервера: `/var/www/wstil/data/www/aihub.fvds.ru/`

- **Веб-сервер (Nginx)**:
    - Роль: Обратный прокси (Reverse Proxy).
    - Файл конфигурации: `/etc/nginx/vhosts/wstil/aihub.fvds.ru.conf`.
    - Ключевые директивы:
        - `listen 443 ssl`: Принимает HTTPS-трафик.
        - `root /var/www/wstil/data/www/aihub.fvds.ru`: Путь к статическим файлам фронтенда.
        - `location /api/`: Блок, проксирующий API-запросы на Node.js-сервер.
        - `location /`: Блок, обслуживающий React-приложение (Single Page Application).
        - `client_max_body_size 10M;`: Разрешает загрузку файлов больше 10MB.

    ```nginx
    # Содержимое файла /etc/nginx/vhosts/wstil/aihub.fvds.ru.conf
    server {
        listen 185.200.179.0:443 ssl;
        server_name aihub.fvds.ru www.aihub.fvds.ru;

        # --- Путь к файлам сайта ---
        root /var/www/wstil/data/www/aihub.fvds.ru;
        index index.html;

        # --- Настройки SSL от Certbot ---
        ssl_certificate /etc/letsencrypt/live/aihub.fvds.ru/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/aihub.fvds.ru/privkey.pem;
        ssl_protocols TLSv1.2 TLSv1.3;
        ssl_ciphers EECDH+AESGCM:EDH+AESGCM;
        ssl_prefer_server_ciphers off;

        # --- Проксирование API-запросов на наш Node.js сервер ---
        location /api/ {
            proxy_pass http://localhost:3001;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }

        # --- Обработка всех остальных запросов для React-приложения ---
        location / {
            try_files $uri /index.html;
        }
    }
    ```

- **Брандмауэр (UFW)**:
    - Установлен и настроен для разрешения необходимого трафика.
    - Команды для настройки:
        ```bash
        # Установка
        apt install ufw
        # Разрешение SSH, HTTP, HTTPS
        ufw allow ssh
        ufw allow 'Nginx HTTP'
        ufw allow 'Nginx HTTPS'
        # Включение
        ufw enable
        ```

- **SSL-сертификат (Let's Encrypt)**:
    - Получен и автоматически обновляется с помощью `certbot`.
    - Команда для получения: `certbot --nginx -d aihub.fvds.ru`.

---

## 7. Управление процессами на VPS (pm2)

Команды выполняются от имени пользователя `wstil`.

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

# Автозагрузка при перезагрузке системы
pm2 startup
pm2 save
```

---

## 8. Обновление кода на VPS

1.  **На локальной машине** отправляем изменения в репозиторий:
    ```bash
    git push origin main
    ```

2.  **На VPS** подключаемся по SSH и переключаемся на пользователя `wstil`:
    ```bash
    su - wstil
    ```

3.  **Обновляем код** из репозитория:
    ```bash
    cd ~/corpaiportal
    git fetch origin
    git reset --hard origin/main
    ```

4.  **Пересобираем и перезапускаем** нужные части:
    ```bash
    # Если изменился прокси-сервер
    cd ~/corpaiportal/proxy
    npm install
    npm run build
    pm2 restart corpai-proxy

    # Если изменился фронтенд
    cd ~/corpaiportal
    npm run build
    # После этого нужно скопировать содержимое папки dist в /var/www/wstil/data/www/aihub.fvds.ru
    # Это проще делать от root через scp с локальной машины
    ```

---

## 9. Troubleshooting на Production

### Проблема: Сайт не открывается (Connection Refused)
**Решение:** Проверить статус брандмауэра `ufw status` (от `root`). Убедиться, что разрешены `Nginx HTTP` и `Nginx HTTPS`.

### Проблема: Отображается "Welcome to nginx!"
**Решение:** Конфликт конфигураций. Проверить `/etc/nginx/sites-enabled/` и `/etc/nginx/nginx.conf` на наличие дублирующих или `default_server` блоков (от `root`).

### Проблема: API-запросы не работают (ошибка 404 или 502)
**Решение:**
1.  Проверить `pm2 logs corpai-proxy` (от `wstil`), чтобы убедиться, что прокси-сервер запущен и не содержит ошибок.
2.  Проверить конфигурацию Nginx: правильный ли `proxy_pass` в `location /api/` (от `root`).

---

**Последнее обновление:** 29 октября 2025  
**Версия:** 1.1
