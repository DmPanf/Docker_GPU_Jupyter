## GPU + Python 3.10 или 3.11

По умолчанию в Ubuntu 20.04 доступен Python 3.8. Чтобы использовать Python 3.10 или 3.11, вам необходимо установить его вручную.

Вот как вы можете установить Python 3.10 и настроить виртуальное окружение:

---

### **Шаг 1: Добавьте PPA-репозиторий deadsnakes**

Этот репозиторий содержит последние версии Python для Ubuntu.

```bash
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
```

### **Шаг 2: Установите Python 3.10 и необходимые модули**

```bash
sudo apt install python3.10 python3.10-venv python3.10-dev -y
```

### **Шаг 3: Проверьте установку Python 3.10**

```bash
python3.10 --version
```

Вы должны увидеть:

```
Python 3.10.x
```

### **Шаг 4: Создайте виртуальное окружение с помощью Python 3.10**

```bash
python3.10 -m venv venv
```

### **Шаг 5: Активируйте виртуальное окружение**

```bash
source venv/bin/activate
```

Теперь ваша командная строка должна отображать префикс `(venv)`, указывающий, что вы находитесь в виртуальном окружении.

### **Шаг 6: Обновите pip**

```bash
pip install --upgrade pip
```

### **Шаг 7: Установите CUDA-версию PyTorch**

Поскольку вы используете CUDA, установите соответствующую версию PyTorch:

```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

Замените `cu118` на вашу версию CUDA, если она отличается.

### **Шаг 8: Установите остальные зависимости**

Создайте или обновите файл `requirements.txt` с вашими зависимостями:

```text
transformers==4.37.2
tiktoken==0.6.0
verovio==4.3.1
accelerate==0.28.0
fastapi==0.95.1
uvicorn==0.22.0
huggingface_hub==0.17.1
```

Установите зависимости:

```bash
pip install -r requirements.txt
```

### **Шаг 9: Скачайте модель GOT-OCR2.0 локально**

Используйте `git lfs` или `huggingface_hub` для загрузки модели.

**Используя `git lfs`:**

```bash
sudo apt install git-lfs
git lfs install
git clone https://huggingface.co/stepfun-ai/GOT-OCR2_0
```

**Или используя скрипт с `huggingface_hub`:**

Создайте файл `download_model.py`:

```python
from huggingface_hub import snapshot_download

snapshot_download(repo_id='stepfun-ai/GOT-OCR2_0', local_dir='GOT-OCR2_0', local_dir_use_symlinks=False)
```

Запустите скрипт:

```bash
python download_model.py
```

### **Шаг 10: Тестирование модели**

Создайте скрипт `test_ocr.py`:

```python
from transformers import AutoModel, AutoTokenizer

# Загрузка модели и токенизатора из локальной директории
tokenizer = AutoTokenizer.from_pretrained('GOT-OCR2_0', trust_remote_code=True)
model = AutoModel.from_pretrained(
    'GOT-OCR2_0',
    trust_remote_code=True,
    low_cpu_mem_usage=True,
    device_map='cuda',
    use_safetensors=True,
    pad_token_id=tokenizer.eos_token_id
).eval().cuda()

# Укажите путь к вашему тестовому изображению
image_file = 'your_test_image.jpg'

# Выполните OCR
res = model.chat(tokenizer, image_file, ocr_type='ocr')

print(res)
```

Запустите скрипт:

```bash
python test_ocr.py
```

### **Шаг 11: Проверьте доступность GPU**

Убедитесь, что PyTorch обнаруживает ваш GPU:

```python
import torch
print(torch.cuda.is_available())
```

Должно вывести `True`.

---

**Примечания:**

- **Убедитесь, что версия CUDA на вашем компьютере соответствует установленной версии PyTorch.**
- **Если у вас возникают ошибки памяти, убедитесь, что ваш GPU имеет достаточно VRAM для загрузки модели.**

### **Дополнительные шаги:**

- Если вы хотите протестировать FastAPI приложение, вы можете следовать инструкциям по его настройке в виртуальной среде.
- Не забудьте установить `uvicorn` и другие необходимые пакеты.

**Установка дополнительных пакетов:**

```bash
pip install uvicorn
```

**Запуск FastAPI приложения:**

```bash
uvicorn main:app --reload
```
