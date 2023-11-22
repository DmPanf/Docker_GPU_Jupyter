import subprocess
import re

try:
    # Выполнение команды lspci и получение строки
    output = subprocess.check_output("lspci -vnn | grep -i vga -A 12 | grep Subsystem", shell=True, text=True)
    
    # Регулярное выражение для поиска модели GPU
    match = re.search(r'\[GeForce GTX \d{3,4} [a-zA-Z0-9]+\]', output)
    if match:
        gpu_model = match.group(0)
        print("Модель GPU:", gpu_model)
    else:
        print("Модель GPU не найдена")

except subprocess.CalledProcessError as e:
    print("Ошибка при вызове команды: ", e)
