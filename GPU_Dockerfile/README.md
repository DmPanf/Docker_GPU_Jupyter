## How to Install PyTorch on the GPU with Docker

- https://saturncloud.io/blog/how-to-install-pytorch-on-the-gpu-with-docker/

## Python Install [Ubuntu 20.04.6 LTS]

- По умолчанию в Ubuntu 20.04 доступен Python 3.8.
- Чтобы использовать Python 3.10 или 3.11, вам необходимо установить его вручную.

###  Шаг 1: Добавьте PPA-репозиторий deadsnakes
- ``sudo apt update``
- **``sudo apt install software-properties-common -y``**
- **``sudo add-apt-repository ppa:deadsnakes/ppa``**
- ``sudo apt update``

### Шаг 2: Установите Python 3.10 (3.11) и необходимые модули
- **``sudo apt install python3.10 python3.10-venv python3.10-dev -y``**
- ``python3.10 --version``

### Шаг 3: Создайте виртуальное окружение с помощью Python 3.10
- **``python3.10 -m venv venv``**
- **``source venv/bin/activate``**
- ``pip install --upgrade pip``
- **``deactivate``**

### Шаг 4: Установите CUDA-версию PyTorch
- ``pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118``
- ``pip install -r requirements.txt``

### Шаг 5: Скачайте модель GOT-OCR2.0 локально
- ``sudo apt install git-lfs``
- ``git lfs install``
- **``git clone https://huggingface.co/stepfun-ai/GOT-OCR2_0``**

---

## 1.0 Installing GPU driver
- ``sudo add-apt-repository ppa:graphics-drivers/ppa``
- ``sudo apt update``
- ``sudo apt install ubuntu-drivers-common``
- ``sudo apt dist-upgrade``
- ``sudo reboot``
- ``sudo ubuntu-drivers autoinstall``
- ``sudo reboot``
- ``nvidia-smi``

## 2.0 Installing Nvidia Container Toolkit
- ``distribution=$(. /etc/os-release;echo  $ID$VERSION_ID)``
- ``curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -`` 
- ``curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list``
- ``sudo apt-get update``
- ``sudo apt-get install -y nvidia-container-toolkit``
- **configure the Docker daemon to recognize the NVIDIA Container Runtime:**
- **``sudo nvidia-ctk runtime configure --runtime=docker``**
- ``sudo systemctl restart docker``

  ## 3.0 Docker with GPU
  - **``docker run -it --gpus all nvidia/cuda:11.4.0-base-ubuntu20.04 nvidia-smi``**
 
  ## 4.0 Setting up Pytorch with GPU Support
  ```Dockerfile
  FROM nvidia/cuda:11.4.0-base-ubuntu20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
        git \
        python3-pip \
        python3-dev \
        python3-opencv \
        libglib2.0-0
# Install any python packages you need
COPY requirements.txt requirements.txt

RUN python3 -m pip install -r requirements.txt

# Upgrade pip
RUN python3 -m pip install --upgrade pip

# Install PyTorch and torchvision
RUN pip3 install torch torchvision torchaudio -f https://download.pytorch.org/whl/cu111/torch_stable.html

# Set the working directory
WORKDIR /app

# Set the entrypoint
ENTRYPOINT [ "python3" ]
```

- **Build the Docker image** # Create "pytorch-gpu" image from the Dockerfile
- **``docker build -t pytorch-gpu . -f Dockerfile``**
- **Run the Docker Container**
- **``docker run --name pytorch-container --gpus all -it --rm -v $(pwd):/app pytorch-gpu``**

```python
# importing torch  
import torch  
# get index of currently selected device  
torch.cuda.current_device() # returns 0 in my case  
# get number of GPUs available  
torch.cuda.device_count() # returns 1 in my case  
# get the name of the device  
torch.cuda.get_device_name(0) # 'NVIDIA GeForce RTX 3060 Laptop GPU' in my case
```

##

  
