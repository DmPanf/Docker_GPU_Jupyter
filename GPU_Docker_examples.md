
### Anaconda Jupyter Notebook for YOLOv8 in Dockerfile with GPU [NVIDIA GeForce RTX 3090 Ti]

- **Dockerfile** - инструкции для сборки образа Docker.
- **docker-compose.yml** - файл конфигурации, который используется для запуска и управления несколькими контейнерами:
  - пределяется список контейнеров, которые необходимо запустить, 
  - а также параметры запуска каждого контейнера, такие как порты, переменные окружения и другие настройки.
- **[🌐 Google Colab Example](https://colab.research.google.com/drive/1J-kp6ORIib4uyeVCtn2JK8_yXWN5qGlU?usp=sharing)**

### Базовые команды:
- **`docker run --gpus all -e JUPYTER_TOKEN='Pa$$wd-345' -p 8001:8001 --rm -v .:/app yolo8-jupyter-gpu`**
- ... или ...
- Создание Dockerfile: [`docker build -t yolo8-jupyter-gpu .`]
- Запуск docker: [`docker-compose up`]
- Проверка: [`docker ps -a`]
- Останов: [`docker stop`]
- Проверка: [`docker images`]
- Удаление: [`docker rmi`]

---

### Examples

![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/db37823d-1b77-4522-aa72-56107c8e77a0)


![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/5f0e6ed6-3ba4-4010-b869-f2ed92ed467f)


![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/ef68c185-9afd-4e4d-ae74-1d7a1dba7b69)


![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/3f50c737-2aab-4109-9c80-8297d6af664a)


---

![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/06c66914-b957-4280-a210-5b2752220115)
