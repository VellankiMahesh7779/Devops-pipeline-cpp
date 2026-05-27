## 📅 Project Progress
--------------------------------------
## ✅ Day 1 - Project Setup

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

## ✅ Day 2 - C++ HTTP Server

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

## ✅ Day 3 - Dockerized Real-Time Monitoring Dashboard

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
