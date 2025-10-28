# Настройка OpenRouter.ai

## Что такое OpenRouter?

OpenRouter предоставляет единый API для доступа к 400+ AI моделям от различных провайдеров (OpenAI, Anthropic, Google, Meta, Mistral и др.).

## Преимущества

- Доступ к большому количеству моделей через единый API
- Автоматическое fallback на резервные модели
- Конкурентные цены
- Не нужно регистрироваться на каждом провайдере отдельно

## Настройка

### 1. Получение API ключа

1. Перейдите на [openrouter.ai](https://openrouter.ai)
2. Войдите через GitHub или Google
3. Откройте раздел "Keys" в личном кабинете
4. Нажмите "Create Key"
5. Скопируйте созданный ключ

### 2. Настройка прокси-сервера

Добавьте ключ в файл `proxy/.env`:

```bash
OPENROUTER_API_KEY=sk-or-v1-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### 3. Перезапуск сервера

Перезапустите прокси-сервер, чтобы изменения вступили в силу.

## Использование

После настройки все модели OpenRouter автоматически появятся в селекторе моделей на фронтенде.

### Примеры популярных моделей

**OpenAI:**
- `openai/gpt-5` - GPT-5
- `openai/gpt-5-mini` - GPT-5 Mini
- `openai/gpt-4o` - GPT-4o

**Google:**
- `google/gemini-2.5-pro` - Gemini 2.5 Pro
- `google/gemini-2.5-flash` - Gemini 2.5 Flash

**Anthropic:**
- `anthropic/claude-opus-4` - Claude Opus 4
- `anthropic/claude-sonnet-4.5` - Claude Sonnet 4.5
- `anthropic/claude-haiku-4.5` - Claude Haiku 4.5

**Meta:**
- `meta-llama/llama-3.1-405b-instruct` - Llama 3.1 405B

**DeepSeek:**
- `deepseek/deepseek-chat-v3.1` - DeepSeek V3.1

**Mistral:**
- `mistralai/mistral-large-2` - Mistral Large 2

## Особенности

- Список моделей обновляется автоматически каждый час
- Модели группируются по провайдерам в селекторе
- Поддержка поиска по названию модели
- Все модели OpenRouter имеют префикс `провайдер/название`

## Цены

Цены на модели различаются. Полную информацию о ценах можно найти на [openrouter.ai/models](https://openrouter.ai/models).

## Лимиты

OpenRouter автоматически интегрируется с существующей системой лимитов портала. Использование моделей OpenRouter учитывается в общих лимитах пользователя.

