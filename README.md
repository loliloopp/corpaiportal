# Корпоративный AI-портал

## Настройка DeepSeek API

Чтобы подключить DeepSeek API:

1. Создайте файл `.env.local` в корне проекта
2. Добавьте следующие переменные:

```
VITE_SUPABASE_URL="YOUR_SUPABASE_URL"
VITE_SUPABASE_ANON_KEY="YOUR_SUPABASE_ANON_KEY"
VITE_DEEPSEEK_API_KEY="sk-dad............"
VITE_DEEPSEEK_BASE_URL="https://api.deepseek.com"
```

3. Замените `YOUR_DEEPSEEK_API_KEY` на ваш реальный API ключ DeepSeek

## Запуск проекта

```bash
npm install
npm run dev
```

## Функции

- Светлая тема интерфейса (как Ollama)
- Переключатель между моделями DeepSeek (Chat, Coder)
- Интеграция с DeepSeek API
- История чатов
- Сохранение в Supabase

