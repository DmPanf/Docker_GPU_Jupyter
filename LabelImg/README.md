# Set up machine learning models with Label Studio

- **🌐 https://github.com/HumanSignal/labelImg**

## Ubuntu Linux
<p><code>
sudo apt-get install pyqt5-dev-tools
sudo pip3 install -r requirements/requirements-linux-python3.txt
make qt5py3
python3 labelImg.py
python3 labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]
</code></p>

## Windows
<p><code>
import os
os.system('python -m venv ImageLabel')
os.system('.\ImageLabel\Scripts\Activate')
os.system('pip install --upgrade pyqt5 lxml')
os.chdir('ImageLabel')
os.system('git clone https://github.com/tzutalin/labelImg')
os.chdir('Labelimg')
os.system('pyrcc5 -o libs/resources.py resources.qrc')
os.system('python labelImg.py')
</code></p>
