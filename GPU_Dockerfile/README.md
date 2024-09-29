## How to Install PyTorch on the GPU with Docker

- https://saturncloud.io/blog/how-to-install-pytorch-on-the-gpu-with-docker/

## Python Install [Ubuntu 20.04.6 LTS]

- По умолчанию в Ubuntu 20.04 доступен Python 3.8.
- Чтобы использовать Python 3.10 или 3.11, вам необходимо установить его вручную.

###  Шаг 1: Добавьте PPA-репозиторий deadsnakes
- ``sudo apt update``
- ``sudo apt install software-properties-common -y``
- ``sudo add-apt-repository ppa:deadsnakes/ppa``
- ``sudo apt update``

### Шаг 2: Установите Python 3.10 (3.11) и необходимые модули
- ``sudo apt install python3.10 python3.10-venv python3.10-dev -y``
- ``python3.10 --version``

### Шаг 3: Создайте виртуальное окружение с помощью Python 3.10
- ``python3.10 -m venv venv``
- ``source venv/bin/activate``
- ``pip install --upgrade pip``

### Шаг 4: Установите CUDA-версию PyTorch
- ``pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118``
- ``pip install -r requirements.txt``

### Шаг 5: Скачайте модель GOT-OCR2.0 локально
- ``sudo apt install git-lfs``
- ``git lfs install``
- ``git clone https://huggingface.co/stepfun-ai/GOT-OCR2_0``

