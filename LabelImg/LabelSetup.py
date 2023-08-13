import os
os.system('python -m venv ImageLabel')
os.system('.\ImageLabel\Scripts\Activate')
os.system('pip install --upgrade pyqt5 lxml')
os.chdir('ImageLabel')
os.system('git clone https://github.com/tzutalin/labelImg')
os.chdir('Labelimg')
os.system('pyrcc5 -o libs/resources.py resources.qrc')
os.system('python labelImg.py')
