FROM python:3.12-slim

WORKDIR /app

# Установка git (на случай, если какие-то пакеты его требуют)
RUN apt-get update && apt-get install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

# Копируем файлы
COPY . .

# ВАЖНОЕ ИЗМЕНЕНИЕ:
# Вместо "pip install ." мы перечисляем библиотеки вручную.
# Это обходит ошибку сборки вашего проекта.
# Мы добавили asyncpg, а asyncio убрали (он встроен в Python 3.12).
RUN pip install --no-cache-dir \
    aiogram \
    alembic \
    dishka \
    dynaconf \
    pydantic \
    pytest-playwright \
    redis \
    sqlalchemy \
    asyncpg

# Запуск
CMD ["sh", "-c", "alembic upgrade head && python main.py"]
