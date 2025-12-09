FROM python:3.12-slim

WORKDIR /app

# Установка системных зависимостей (если понадобятся)
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Копируем файлы проекта
COPY . .

# Устанавливаем зависимости.
# ВАЖНО: В pyproject.toml не указан драйвер базы данных. 
# Мы добавляем asyncpg принудительно для работы с PostgreSQL.
RUN pip install --no-cache-dir . asyncpg

# Команда запуска: сначала накатываем миграции, потом запускаем бота
CMD ["sh", "-c", "alembic upgrade head && python main.py"]
