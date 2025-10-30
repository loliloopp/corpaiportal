# Архитектура тестового портала (testaihub.fvds.ru)

## Общая информация

**Тестовый портал** развернут на том же VPS, что и production портал, но с полной изоляцией:
- Отдельный пользователь (`wstil-test`)
- Отдельный прокси-сервер (порт 3002)
- Отдельный фронтенд (домен `testaihub.fvds.ru`)
- Та же база данных Supabase (общая для development)

Цель: тестирование новых фич без влияния на production (`aihub.fvds.ru`).

---

## 1. Структура директорий

```
/var/www/wstil-test/
├── data/
│   ├── corpaiportal-test/              # Основной проект
│   │   ├── src/                        # Исходный код фронтенда
│   │   ├── proxy/                      # Прокси-сервер
│   │   │   ├── src/
│   │   │   ├── dist/                   # Собранный прокси
│   │   │   ├── package.json
│   │   │   ├── tsconfig.json
│   │   │   └── .env                    # Переменные окружения (PORT=3002)
│   │   ├── dist/                       # Собранный фронтенд
│   │   ├── package.json
│   │   ├── vite.config.ts
│   │   └── .git/
│   └── www/
│       └── testaihub.fvds.ru/          # Развернутый фронтенд (статические файлы)
│           ├── index.html
│           ├── assets/
│           │   ├── index-*.css
│           │   ├── index-*.js
│           │   └── favicon.svg
│           └── [остальные статические файлы]
├── email/
├── logs/
└── mod-tmp/
```

---

## 2. Пользователь и права доступа

- **Пользователь**: `wstil-test`
- **Группа**: `wstil-test`
- **Владелец всех директорий**: `wstil-test:wstil-test`

Все команды для управления тестовым сервером выполняются от пользователя `wstil-test`.

---

## 3. Прокси-сервер (Node.js)

### Расположение
- **Код**: `/var/www/wstil-test/data/corpaiportal-test/proxy/`
- **Собранные файлы**: `/var/www/wstil-test/data/corpaiportal-test/proxy/dist/`

### Порт
- **PORT**: 3002 (указан в `.env`)

### Переменные окружения (`.env`)

```
# Supabase (те же, что в production)
SUPABASE_URL=https://...supabase.co
SUPABASE_SERVICE_ROLE_KEY=...

# AI Providers (те же, что в production)
OPENAI_API_KEY=...
OPENROUTER_API_KEY=...
DEEPSEEK_API_KEY=...
GROK_API_KEY=...
GEMINI_API_KEY=...

# Порт для тестового прокси
PORT=3002
```

### Управление через pm2

От пользователя `wstil-test`:

```bash
# Запуск
pm2 start /var/www/wstil-test/data/corpaiportal-test/proxy/dist/index.js --name corpai-proxy-test

# Перезапуск
pm2 restart corpai-proxy-test

# Остановка
pm2 stop corpai-proxy-test

# Удаление
pm2 delete corpai-proxy-test

# Просмотр логов
pm2 logs corpai-proxy-test

# Список процессов
pm2 list
```

---

## 4. Фронтенд (статические файлы)

### Расположение
- **Исходный код**: `/var/www/wstil-test/data/corpaiportal-test/`
- **Собранные файлы**: `/var/www/wstil-test/data/corpaiportal-test/dist/`
- **Развернутые файлы**: `/var/www/wstil-test/data/www/testaihub.fvds.ru/`

### Сборка

От пользователя `wstil-test`:

```bash
cd /var/www/wstil-test/data/corpaiportal-test

# Обновляем код
git fetch origin
git reset --hard origin/main

# Устанавливаем зависимости
npm install

# Собираем фронтенд
npm run build
```

После сборки файлы появляются в `dist/`. Затем их нужно скопировать в директорию веб-сервера (от `root`):

```bash
cp -r /var/www/wstil-test/data/corpaiportal-test/dist/* /var/www/wstil-test/data/www/testaihub.fvds.ru/
chown -R wstil-test:wstil-test /var/www/wstil-test/data/www/testaihub.fvds.ru
```

---

## 5. Веб-сервер (Nginx)

### Расположение конфига
- **Файл**: `/etc/nginx/vhosts/wstil-test/testaihub.fvds.ru.conf`

### Конфигурация

```nginx
# HTTP сервер (редирект на HTTPS)
server {
        server_name testaihub.fvds.ru www.testaihub.fvds.ru;
        charset off;
        index index.html;
        disable_symlinks if_not_owner from=$root_path;
        include /etc/nginx/vhosts-includes/*.conf;
        include /etc/nginx/vhosts-resources/testaihub.fvds.ru/*.conf;
        include /etc/nginx/users-resources/wstil-test/*.conf;
        access_log /var/www/httpd-logs/testaihub.fvds.ru.access.log;
        error_log /var/www/httpd-logs/testaihub.fvds.ru.error.log notice;
        ssi on;
        set $root_path /var/www/wstil-test/data/www/testaihub.fvds.ru;
        root $root_path;
        listen 185.200.179.0:80;
        gzip on;
        gzip_comp_level 5;
        gzip_disable "msie6";
        gzip_types text/plain text/css application/json application/x-javascript;
        location / {
                location ~* ^.+\.(jpg|jpeg|gif|png|svg|js|css|mp3|ogg|mpe?g|avi|mov)$ {
                        expires 24h;
                }
        }
}

# HTTPS сервер (основной)
server {
        server_name testaihub.fvds.ru www.testaihub.fvds.ru;
        ssl_certificate "/var/www/httpd-cert/wstil-test/testaihub.fvds.ru_le1.crt";
        ssl_certificate_key "/var/www/httpd-cert/wstil-test/testaihub.fvds.ru_le1.key";
        ssl_ciphers EECDH:+AES256:-3DES:RSA+AES:!NULL:!RC4;
        ssl_prefer_server_ciphers on;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
        ssl_dhparam /etc/ssl/certs/dhparam4096.pem;
        charset off;
        index index.html;
        disable_symlinks if_not_owner from=$root_path;
        include /etc/nginx/vhosts-includes/*.conf;
        include /etc/nginx/vhosts-resources/testaihub.fvds.ru/*.conf;
        include /etc/nginx/users-resources/wstil-test/*.conf;
        access_log /var/www/httpd-logs/testaihub.fvds.ru.access.log;
        error_log /var/www/httpd-logs/testaihub.fvds.ru.error.log notice;
        ssi on;
        set $root_path /var/www/wstil-test/data/www/testaihub.fvds.ru;
        root $root_path;
        listen 185.200.179.0:443 ssl;
        gzip on;
        gzip_comp_level 5;
        gzip_disable "msie6";
        gzip_types text/plain text/css application/json application/x-javascript;
        location / {
                location ~* ^.+\.(jpg|jpeg|gif|png|svg|js|css|mp3|ogg|mpe?g|avi|mov)$ {
                        expires 24h;
                }
        }
        location /api/ {
            proxy_pass http://localhost:3002;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
        }
}
```

### Ключевые директивы
- **listen 185.200.179.0:443 ssl**: Слушает HTTPS на IP сервера
- **root /var/www/wstil-test/data/www/testaihub.fvds.ru**: Путь к статическим файлам
- **location /api/**: Проксирует API-запросы на прокси-сервер (порт 3002)
- **location /**: Обслуживает React SPA

---

## 6. Сертификат

### Текущий статус
- **Тип**: Самоподписанный сертификат (от ISPmanager)
- **Расположение**:
  - `/var/www/httpd-cert/wstil-test/testaihub.fvds.ru_le1.crt`
  - `/var/www/httpd-cert/wstil-test/testaihub.fvds.ru_le1.key`

### Проблема
DNS домена `testaihub.fvds.ru` не распространился полностью, поэтому не удается получить Let's Encrypt сертификат.

### Решение
После распространения DNS (обычно 30 минут - 1 час) в ISPmanager можно будет получить Let's Encrypt сертификат через:
1. **Сертификаты** → найдите `testaihub.fvds.ru`
2. Нажмите **Повторить проверку**

---

## 7. Брандмауэр (UFW)

Открытые порты:
- **80** (HTTP): Редирект на HTTPS
- **443** (HTTPS): Основной трафик
- **3002** (TCP): Прокси-сервер

```bash
# Открытые правила
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 3002/tcp
```

---

## 8. Различия между Production и Test

| Параметр | Production | Test |
|----------|-----------|------|
| Домен | `aihub.fvds.ru` | `testaihub.fvds.ru` |
| Пользователь | `wstil` | `wstil-test` |
| Директория проекта | `/var/www/wstil/data/corpaiportal/` | `/var/www/wstil-test/data/corpaiportal-test/` |
| Директория фронтенда | `/var/www/wstil/data/www/aihub.fvds.ru/` | `/var/www/wstil-test/data/www/testaihub.fvds.ru/` |
| Порт прокси | 3001 | 3002 |
| Имя процесса pm2 | `corpai-proxy` | `corpai-proxy-test` |
| Сертификат | Let's Encrypt (валидный) | Самоподписанный |
| База данных | Supabase (production) | Supabase (same, for development) |

---

## 9. Проверка статуса

### Проверить, что оба прокси работают

От `root`:

```bash
# Production прокси (3001)
curl -s http://localhost:3001/api/health

# Test прокси (3002)
curl -s http://localhost:3002/api/health
```

Оба должны ответить: `Proxy server is running`

### Просмотр процессов pm2

От пользователя `wstil-test`:

```bash
pm2 list
```

Должно быть виднь `corpai-proxy-test` со статусом `online`.

### Проверить логи тестового прокси

От пользователя `wstil-test`:

```bash
pm2 logs corpai-proxy-test --lines 50
```

---

## 10. Развертывание обновлений на Test сервере

От пользователя `wstil-test`:

```bash
# Переходим в папку проекта
cd /var/www/wstil-test/data/corpaiportal-test

# Получаем последние изменения
git fetch origin
git reset --hard origin/main

# Обновляем фронтенд
npm install
npm run build

# Обновляем прокси
cd proxy
npm install
npm run build

# Перезапускаем прокси
pm2 restart corpai-proxy-test
```

От `root`:

```bash
# Копируем новый фронтенд
cp -r /var/www/wstil-test/data/corpaiportal-test/dist/* /var/www/wstil-test/data/www/testaihub.fvds.ru/
chown -R wstil-test:wstil-test /var/www/wstil-test/data/www/testaihub.fvds.ru

# Перезагружаем Nginx
systemctl reload nginx
```

---

## 11. DNS и доменное имя

### Проблема
DNS домен `testaihub.fvds.ru` не полностью распространился на серверы имен `ns1.firstvds.ru` и `ns2.firstvds.ru`.

### Проверка DNS

```bash
nslookup testaihub.fvds.ru
dig testaihub.fvds.ru @ns1.firstvds.ru
dig testaihub.fvds.ru @ns2.firstvds.ru
```

Если выводит `NXDOMAIN` — DNS зона не синхронизирована.

### Решение
В ISPmanager:
1. **DNS** → **Зоны DNS** → проверить, что `testaihub.fvds.ru` создана
2. Если нет — создать вручную и дождаться синхронизации (30 минут - 1 час)

---

## 12. Тестирование

### Локальное тестирование (без DNS)

Добавьте в файл `hosts` на вашем компьютере:

**Windows:** `C:\Windows\System32\drivers\etc\hosts`
```
185.200.179.0 testaihub.fvds.ru
```

**Mac/Linux:** `/etc/hosts`
```
185.200.179.0 testaihub.fvds.ru
```

Затем откройте `https://testaihub.fvds.ru` в браузере.

Браузер выдаст предупреждение о самоподписанном сертификате — это нормально для тестирования.

### Тестирование после распространения DNS

Когда DNS распространится, откройте `https://testaihub.fvds.ru` в браузере напрямую.

