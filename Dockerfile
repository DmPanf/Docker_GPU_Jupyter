# syntax=docker/dockerfile:1
# Образ tensorflow/tensorflow:latest-gpu-jupyter уже содержит TensorFlow с поддержкой GPU и Jupyter Notebook,
# а также Python и pip, поэтому установка python3, python3-pip и python3-dev не обязательна.
FROM tensorflow/tensorflow:latest-gpu-jupyter

LABEL version="2.3"
LABEL build-date="27-03-2023"
LABEL description="FastAPI for Tree Segmentation Solutions"
LABEL maintainer="Dmitry 7292337@gmail.com"
LABEL url="https://github.com/terrainternship/rostelecom_tree_segmentation/blob/main/command/Dmitry_Panfilov/code/Docker/README.md"
LABEL license="MIT"

# Установка необходимых пакетов и обновление системы
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
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

# Открываем порт 8000 для работы FastAPI
EXPOSE 8000

# Запускаем приложение с помощью Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
