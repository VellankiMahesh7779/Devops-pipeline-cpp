#📅 Project Progress
--------------------------------------
#✅ Day 1 - Project Setup

### Completed Tasks
- Created GitHub repository
- Initialized Git repository
- Created project structure
- Added README.md
- Configured GitHub Actions CI pipeline

### Technologies Used
- Git
- GitHub
- GitHub Actions
---------------------------------------------------------------

#✅ Day 2 - C++ HTTP Server

### Completed Tasks
- Built lightweight HTTP server using C++
- Added API endpoints:
  - `/`
  - `/health`
- Configured server to run on port `9090`
- Tested using browser and curl

### Technologies Used
- C++
- cpp-httplib
- Linux Networking

###To run server, use below command to build c++
g++ server.cpp -o server
./server
o/p= Server running on http://localhost:9090

-----------------------------------------------------------------

#✅ Day 3 - Dockerized Real-Time Monitoring Dashboard

### Completed Tasks
- Dockerized C++ application
- Built real-time monitoring dashboard
- Added:
  - CPU Usage Monitoring
  - RAM Usage Monitoring
  - Disk Usage Monitoring
- Created Dockerfile
- Built and ran Docker container

### Technologies Used
- Docker
- Linux System Commands
- C++
- HTML/CSS
------------------------------------------------------------

## 🐳 Docker Commands

### Build Docker Image
docker build -t devops-cpp-app .

### Run Docker Container
docker run --rm -p 9090:9090 devops-cpp-app

### Stop Existing Running Container
If port `9090` is already in use, stop the running container first.

#### Check Running Containers
docker ps

#### Stop Container
docker stop <container_id>

Example:
docker stop abc123

### Access Dashboard
Open in browser:
http://localhost:9090
###Replace localhost with your local IP
###ex:http:12.34.56.78:9090
```
--------------------------------------------------------------------------
# ✅ Day 4 - GitHub Actions CI Pipeline

### Completed Tasks
- Added GitHub Actions workflow
- Enabled automatic CI pipeline on every push
- Automated C++ build process
- Automated Docker image build

### Technologies Used
- GitHub Actions
- YAML
- Docker
- C++

---

## 📁 Workflow File

.github/workflows/ci.yml
```
Pipeline runs automatically on every branch push.
--------------------------------------------------------------------------

# 🚀 Day 5 - Docker Hub Integration

### Completed Tasks
- Created Docker Hub repository
- Logged in to Docker Hub
- Tagged Docker image
- Pushed image to Docker Hub
- Pulled image from Docker Hub
- Verified image deployment

### Commands

#### Login to Docker Hub
docker login
```

#### Tag Docker Image
docker tag devops-cpp-app vellankimahesh1999/devops-cpp-app:v1
```
### Check image tagged or not
docker image
-----

#### Push Image
docker push vellankimahesh1999/devops-cpp-app:v1
```

#### Pull Image
docker pull vellankimahesh1999/devops-cpp-app:v1
```

#### Run Image
docker run --rm -p 9090:9090 vellankimahesh1999/devops-cpp-app:v1
```
### Docker Hub Repository
vellankimahesh1999/devops-cpp-app

### Process
Build Image
    ↓
Tag Image
    ↓
Push to Docker Hub
    ↓
Pull from Docker Hub
    ↓
Run Container
```
-----------------------------------------------------------------
# 🚀 Day 6 - Jenkins CI Pipeline

### Completed Tasks
- Created Jenkins Pipeline Job
- Connected Jenkins with GitHub Repository
- Added Jenkinsfile
- Automated C++ Build
- Automated Docker Image Build

### Pipeline Stages
Checkout Code
    ↓
Build C++
    ↓
Build Docker Image

### Jenkinsfile Location
Jenkinsfile
```
-----------------------------------------------------------------------
