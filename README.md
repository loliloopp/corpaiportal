# Корпоративный AI-портал

Корпоративный AI-портал для сотрудников с контролем доступа, лимитами и статистикой.

## Возможности

- **Множество AI моделей**: OpenAI, Google Gemini, Anthropic Claude, DeepSeek, Grok, и 400+ моделей через OpenRouter
- **Контроль доступа**: Гибкая система управления доступом к моделям
- **Лимиты**: Дневные/месячные лимиты по запросам и токенам
- **Статистика**: Полная аналитика использования
- **История чатов**: Сохранение всех диалогов в Supabase
- **Темная/светлая тема**: Адаптивный интерфейс

## Настройка

### Фронтенд

Создайте файл `.env.local` в корне проекта:

```bash
VITE_SUPABASE_URL="your-supabase-url"
VITE_SUPABASE_ANON_KEY="your-anon-key"
VITE_API_URL="http://localhost:3000"
```

### Прокси-сервер

Создайте файл `proxy/.env`:

```bash
SUPABASE_URL="your-supabase-url"
SUPABASE_SERVICE_ROLE_KEY="your-service-role-key"
PORT=3000

# AI Provider Keys
OPENAI_API_KEY="sk-..."
GEMINI_API_KEY="..."
DEEPSEEK_API_KEY="sk-..."
GROK_API_KEY="xai-..."
OPENROUTER_API_KEY="sk-or-v1-..."  # Доступ к 400+ моделям
```

### OpenRouter (Рекомендуется)

OpenRouter предоставляет доступ к 400+ моделям через единый API. См. [docs/OPENROUTER_SETUP.md](docs/OPENROUTER_SETUP.md) для подробной настройки.

## Запуск проекта

```bash
# Установка зависимостей
npm install
cd proxy && npm install

# Запуск фронтенда
npm run dev

# Запуск прокси (в отдельном терминале)
cd proxy && npm run dev
```

## Документация

- [Настройка OpenRouter](docs/OPENROUTER_SETUP.md)
- [Управление доступом к моделям](docs/MODEL_ACCESS_IMPLEMENTATION.md)
- [Сценарии использования](docs/USAGE_SCENARIOS.md)
- [Руководство по развертыванию](docs/DEPLOYMENT_GUIDE.md)

## Архитектура

- **Frontend**: React 18 + TypeScript + Vite + Ant Design
- **Backend**: Node.js + Express (прокси-сервер)
- **Database**: Supabase (PostgreSQL)
- **AI Providers**: OpenAI, Google, Anthropic, DeepSeek, Grok, OpenRouter

