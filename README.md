## Anaconda Jupyter Notebook with YOLOv8 in Docker 🐳📓

Welcome to our guide on setting up an Anaconda Jupyter Notebook environment for running YOLOv8, fully equipped with NVIDIA GeForce RTX 3090 Ti GPU support! 🚀

### Prerequisites 📋

Before you begin, make sure you have the following:

- NVIDIA GPU drivers installed on your system (we're using an NVIDIA GeForce RTX 3090 Ti).
- Docker and NVIDIA-Docker installed.
- Basic knowledge of Docker and Jupyter Notebooks.

![image](https://github.com/DmPanf/Docker_GPU_Jupyter/assets/99917230/f90de448-3298-4a51-a81f-ff9d876e6279)


### Installation 🛠️

#### Step 1: Clone the Repository

Clone this repository to your local machine using:

```bash
git clone [URL-to-this-repository]
cd [Repository-Name]
```

#### Step 2: Build the Docker Image

To build the Docker image with Anaconda and Jupyter Notebook, run:

```bash
docker build -t yolo-notebook .
```

This will create an image named `yolo-notebook` containing Anaconda, Jupyter Notebook, and all the necessary dependencies for YOLOv8.

#### Step 3: Run the Docker Container

Start the container with GPU support:

```bash
docker run --gpus all -p 8888:8888 -v $(pwd)/notebooks:/workspace/notebooks yolo-notebook
```

This command will start a Jupyter Notebook server, mapping the container's port 8888 to your local port 8888, and mount a local `notebooks` directory to the container.

### Using Jupyter Notebook 📔

After starting the container, you'll see a URL in your terminal. Copy and paste this URL into your web browser to access the Jupyter Notebook interface.

In the Jupyter interface, navigate to the `notebooks` directory where you can create new notebooks or open existing ones.

### Running YOLOv8 🔍

To run YOLOv8 in a Jupyter Notebook:

1. Open a new notebook in the Jupyter interface.
2. Import necessary libraries and load your YOLOv8 model.
3. Run your object detection tasks as required.

---

### Troubleshooting 🛠

- **GPU not recognized**: Ensure NVIDIA drivers and NVIDIA-Docker are properly installed.
- **Docker build issues**: Check the Dockerfile for any errors or missing dependencies.
- **Jupyter Notebook access issues**: Ensure the Docker container is running and the port mapping is correct.

### Contribution and Support 🤝

Contributions to this project are welcome! Please submit pull requests or open issues for any improvements or suggestions.

For support, please open an issue in this repository.

### License 📜

This project is licensed under [LICENSE-NAME]. See the [LICENSE](LICENSE) file for details.

