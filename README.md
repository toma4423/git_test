# git_test
すごいだろ！

## Docker Usage

### 1. Build the Docker image
```bash
docker build -t my-python-app .
```

### 2. Run the Docker container
```bash
docker run -d -p 8000:8000 my-python-app
```

### 3. Access the application
Open your web browser and go to [http://localhost:8000](http://localhost:8000).

### 4. Stop the container
To stop the container, first find the container ID:
```bash
docker ps
```
Then, use the container ID to stop it:
```bash
docker stop <CONTAINER_ID>
```
