# Инструкция по развертыванию приложения на VPS с Ubuntu

Этот гайд описывает пошаговый процесс развертывания корпоративного AI-портала на чистом сервере с Ubuntu 22.04.

## Предварительные требования

1.  **VPS с Ubuntu 22.04**: Сервер с как минимум 1 ядром CPU, 1 ГБ RAM и 25 ГБ SSD.
2.  **SSH-доступ**: Возможность подключиться к серверу с правами `root` или `sudo`.
3.  **Доменное имя (Опционально)**: Если вы хотите использовать HTTPS, вам понадобится домен, направленный на IP-адрес вашего VPS. Если домена нет, инструкция предусматривает работу по IP-адресу через HTTP.

---

## Шаг 1: Подготовка локального проекта

Перед загрузкой кода на сервер убедитесь, что все готово локально.

### 1.1. Создайте `Dockerfile` для фронтенда

В корневой папке вашего проекта создайте файл `Dockerfile` (без расширения) со следующим содержимым:

```dockerfile
# Этап 1: Сборка React-приложения
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Этап 2: Запуск на веб-сервере Nginx
FROM nginx:stable-alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

### 1.2. Загрузите код в Git-репозиторий

Сохраните все изменения и загрузите их в ваш удаленный репозиторий.

```bash
git add .
git commit -m "feat: add proxy server and docker configuration"
git push
```

---

## Шаг 2: Настройка сервера

Подключитесь к вашему VPS по SSH и выполните следующие команды.

```bash
ssh root@<IP_адрес_вашего_VPS>
```

### 2.1. Установите Docker и Docker Compose

```bash
# Обновляем пакеты и устанавливаем Docker
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Устанавливаем Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

### 2.2. Настройте веб-сервер Nginx

Сначала остановим и отключим Apache, если он установлен, чтобы избежать конфликта портов.

```bash
# Останавливаем и отключаем Apache2 (если он есть)
sudo systemctl stop apache2
sudo systemctl disable apache2

# Устанавливаем Nginx и Git
sudo apt install -y nginx git
```

### 2.3. Загрузите код приложения на сервер

```bash
# Клонируем репозиторий
git clone <URL_вашего_репозитория> /var/www/corpaiportal

# Переходим в директорию проекта
cd /var/www/corpaiportal
```

### 2.4. Настройте Nginx

Создайте конфигурационный файл для вашего сайта.

```bash
sudo nano /etc/nginx/sites-available/corpaiportal
```

Вставьте в него конфигурацию ниже. **Важно:** используйте свой IP-адрес вместо `185.200.179.0`.

```nginx
server {
    listen 80;
    server_name 185.200.179.0; # <-- УКАЖИТЕ ВАШ IP-АДРЕС

    location / {
        proxy_pass http://localhost:8080; # Порт frontend-контейнера
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /api/ {
        proxy_pass http://localhost:3001/api/; # Порт proxy-контейнера
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```
Сохраните файл (`Ctrl+X`, `Y`, `Enter`).

Активируйте конфигурацию и перезапустите Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/corpaiportal /etc/nginx/sites-enabled/
# Проверяем на наличие ошибок и перезапускаем
sudo nginx -t && sudo systemctl reload nginx
```

---

## Шаг 3: Запуск приложения

### 3.1. Создайте `.env` файл для прокси

Это **самый важный** шаг для работы прокси. Создайте файл с переменными окружения.

```bash
sudo nano /var/www/corpaiportal/proxy/.env
```

Добавьте в него **все** необходимые ключи:
```
# Supabase
VITE_SUPABASE_URL=https://<your-project-ref>.supabase.co
SUPABASE_SERVICE_ROLE_KEY=<your-supabase-service-role-key>

# AI Providers
OPENAI_API_KEY=<your-openai-key>
GROK_API_KEY=<your-grok-key>
DEEPSEEK_API_KEY=<your-deepseek-key>
GEMINI_API_KEY=<your-gemini-key>
```
Сохраните файл (`Ctrl+X`, `Y`, `Enter`).

### 3.2. Соберите и запустите Docker-контейнеры

Находясь в папке `/var/www/corpaiportal`, выполните команду:
```bash
sudo docker-compose up --build -d
```
- `--build`: принудительно пересобрать образы.
- `-d`: запустить в фоновом режиме.

Через несколько минут ваше приложение должно быть доступно по адресу `http://<IP_адрес_вашего_VPS>`.

## Управление приложением

-   **Проверить статус контейнеров:** `sudo docker-compose ps`
-   **Посмотреть логи (например, фронтенда):** `sudo docker-compose logs -f frontend`
-   **Остановить приложение:** `sudo docker-compose down`
-   **Обновить приложение после изменений в коде:**
    ```bash
    cd /var/www/corpaiportal
    git pull # Скачать последнюю версию кода
    sudo docker-compose up --build -d # Пересобрать и перезапустить
    ```
