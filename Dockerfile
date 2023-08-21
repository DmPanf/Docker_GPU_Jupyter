# Dockerfile
FROM tensorflow/tensorflow:latest-gpu-jupyter

LABEL version="2.3"
LABEL build-date="20-08-2023"
LABEL description="FastAPI for AI Solutions"
LABEL maintainer="Dmitry 7292337@gmail.com"
LABEL url="./README.md"
LABEL license="MIT"

# Установка необходимых пакетов и обновление системы
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip with no cache
RUN pip install --no-cache-dir -U pip

# Создаем рабочую директорию для нашего приложения
WORKDIR /app

# Копируем файлы и директории из локального контекста сборки в рабочую директорию образа
COPY . /app

# Установка дополнительных зависимостей, указанных в requirements.txt (если они есть)
RUN if [ -f "requirements.txt" ]; then pip install --no-cache-dir -r requirements.txt; fi

# Открываем порт 8001 для работы Jupyter
EXPOSE 8001

# Запускаем Jupyter Notebook на порту 8001
CMD ["jupyter", "notebook", "--port=8001", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
