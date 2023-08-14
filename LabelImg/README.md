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

## Windows + Anaconda
<p><code>
conda install pyqt=5
conda install -c anaconda lxml
pyrcc5 -o libs/resources.py resources.qrc
python labelImg.py
python labelImg.py [IMAGE_PATH] [PRE-DEFINED CLASS FILE]
</code></p>

## Use Docker
<p><code>
docker run -it \
--user $(id -u) \
-e DISPLAY=unix$DISPLAY \
--workdir=$(pwd) \
--volume="/home/$USER:/home/$USER" \
--volume="/etc/group:/etc/group:ro" \
--volume="/etc/passwd:/etc/passwd:ro" \
--volume="/etc/shadow:/etc/shadow:ro" \
--volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
-v /tmp/.X11-unix:/tmp/.X11-unix \
tzutalin/py2qt4

make qt4py2;./labelImg.py
</code></p>

---

![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/575c26fa-e0af-40b9-8833-8c07db8ae001)

---

![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/ee0ae455-cc0f-4c7b-8794-9b11be276490)
