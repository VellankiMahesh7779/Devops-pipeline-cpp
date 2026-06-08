# 📅 Project Progress

# ✅ Day 1 - Project Setup

## Completed Tasks

* Created GitHub repository
* Initialized Git repository
* Created project structure
* Added README.md
* Configured GitHub Actions CI pipeline

## Technologies Used

* Git
* GitHub
* GitHub Action

# ✅ Day 2 - C++ HTTP Server

## Completed Tasks

* Built lightweight HTTP server using C++
* Added API endpoints:

  * /
  * /health
* Configured server to run on port 9090
* Tested using browser and curl

## Technologies Used

* C++
* cpp-httplib
* Linux Networking

### To build and run the server

```bash
g++ server.cpp -o server
./server
```

### Output

```text
Server running on http://localhost:9090
```

# ✅ Day 3 - Dockerized Real-Time Monitoring Dashboard

## Completed Tasks

* Dockerized C++ application
* Built real-time monitoring dashboard
* Added:

  * CPU Usage Monitoring
  * RAM Usage Monitoring
  * Disk Usage Monitoring
* Created Dockerfile
* Built and ran Docker container

## Technologies Used

* Docker
* Linux System Commands
* C++
* HTML/CSS

## 🐳 Docker Commands

### Build Docker Image

```bash
docker build -t devops-cpp-app .
```

### Run Docker Container

```bash
docker run --rm -p 9090:9090 devops-cpp-app
```

### Check Running Containers

```bash
docker ps
```

### Stop Container

```bash
docker stop <container_id>
```

### Example

```bash
docker stop abc123
```

### Access Dashboard

```text
http://localhost:9090
```

Replace localhost with your local IP.

Example:

```text
http://12.34.56.78:9090
```

---

# ✅ Day 4 - GitHub Actions CI Pipeline

## Completed Tasks

* Added GitHub Actions workflow
* Enabled automatic CI pipeline on every push
* Automated C++ build process
* Automated Docker image build

## Technologies Used

* GitHub Actions
* YAML
* Docker
* C++

## 📁 Workflow File

```text
.github/workflows/ci.yml
```

Pipeline runs automatically on every branch push.

# 🚀 Day 5 - Docker Hub Integration

## Completed Tasks

* Created Docker Hub repository
* Logged in to Docker Hub
* Tagged Docker image
* Pushed image to Docker Hub
* Pulled image from Docker Hub
* Verified image deployment

## Commands

### Login to Docker Hub

```bash
docker login
```

### Tag Docker Image

```bash
docker tag devops-cpp-app vellankimahesh1999/devops-cpp-app:v1
```

### Check Image Tagged or Not

```bash
docker images
```

### Push Image

```bash
docker push vellankimahesh1999/devops-cpp-app:v1
```

### Pull Image

```bash
docker pull vellankimahesh1999/devops-cpp-app:v1
```

### Run Image

```bash
docker run --rm -p 9090:9090 vellankimahesh1999/devops-cpp-app:v1
```

### Docker Hub Repository

```text
vellankimahesh1999/devops-cpp-app
```

### Process

```text
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

# 🚀 Day 6 - Jenkins CI Pipeline

## Completed Tasks

* Created Jenkins Pipeline Job
* Connected Jenkins with GitHub Repository
* Added Jenkinsfile
* Automated C++ Build
* Automated Docker Image Build

## Pipeline Stages

```text
Checkout Code
      ↓
Build C++
      ↓
Build Docker Image
```

## Jenkinsfile Location

```text
Jenkinsfile
```

---

# 🚀 Day 8 - Continuous Deployment with Jenkins

## Completed Tasks

* Added deployment stage to Jenkins pipeline
* Automated Docker container deployment
* Configured Jenkins to stop old container
* Configured Jenkins to start new container
* Verified application deployment after every code push

## Workflow

```text
Developer Pushes Code
          ↓
GitHub Webhook
          ↓
Jenkins Pipeline Triggered
          ↓
Build C++ Application
          ↓
Build Docker Image
          ↓
Stop Existing Container
          ↓
Deploy New Container
          ↓
Application Available on Port 9090
```

## Verification Commands

### Check Running Container

```bash
docker ps
```

### View Container Logs

```bash
docker logs devops-cpp-container
```

### Access Application

```text
http://localhost:9090
```

## Technologies Used

* GitHub
* GitHub Webhooks
* Jenkins
* Docker
* C++
* Linux

## Key Learning

* Continuous Integration (CI)
* Continuous Deployment (CD)
* Jenkins Pipeline
* Docker Container Management
* Automated Application Deployment

---

# 🚀 Day 9 - Docker Compose

## Completed Tasks

* Created docker-compose.yml
* Automated container deployment
* Managed application using Docker Compose
* Simplified Docker build and run process

## Why Docker Compose?

Instead of running multiple Docker commands manually:

```bash
docker build -t devops-cpp-app .
docker run -p 9090:9090 devops-cpp-app
```

Docker Compose allows managing everything using a single configuration file.

## Commands

### Start Application

```bash
docker-compose up
```

### Start in Background

```bash
docker-compose up -d
```

### Check Running Containers

```bash
docker-compose ps
```

### View Logs

```bash
docker-compose logs
```

### Stop Application

```bash
docker-compose down
```

## Workflow

```text
docker-compose.yml
        ↓
Build Image
        ↓
Create Container
        ↓
Start Application
```

## Technologies Used

* Docker
* Docker Compose
* C++
* Linux

# 🚀 Day 10 - Kubernetes Setup

## Completed Tasks

* Installed kubectl
* Installed Minikube
* Started Kubernetes Cluster
* Verified Cluster Status
* Learned basic kubectl commands

## Commands

```bash
kubectl get nodes
kubectl get pods -A
kubectl get svc
```

## Key Learning

* Kubernetes
* Minikube
* kubectl
* Cluster
* Node
* Pod

# 🚀 Day 11 - Kubernetes Deployment

## Completed Tasks

* Created deployment.yaml
* Created service.yaml
* Deployed application to Kubernetes
* Created 2 replicas
* Exposed application using NodePort Service
* Verified Kubernetes self-healing
* Accessed application using port-forward

## Commands

### Deploy Application

```bash
kubectl apply -f k8s/deployment.yaml
```

### Create Service

```bash
kubectl apply -f k8s/service.yaml
```

### Check Deployments

```bash
kubectl get deployments
```

### Check Pods

```bash
kubectl get pods
```

### Check Services

```bash
kubectl get svc
```

### Port Forward Service

```bash
kubectl port-forward service/devops-cpp-service 9090:9090
```
# 📅 Day 13 - Prometheus & Grafana Monitoring Setup

## ✅ Completed Tasks

* Installed Prometheus using Helm
* Installed Grafana using Helm
* Configured Grafana access
* Connected Grafana with Prometheus
* Imported Node Exporter Dashboard (ID: 1860)
* Verified CPU, Memory, Disk and Node metrics
* Successfully monitored Kubernetes Minikube cluster

---

## 🛠 Installation Commands

### Install Helm Repository

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

helm repo add grafana https://grafana.github.io/helm-charts

helm repo update
```

### Install Prometheus

```bash
helm install prometheus prometheus-community/prometheus
```
Verify: Running or not
```bash
kubectl get pods
```
### Install Grafana

```bash
helm install grafana grafana/grafana
```
Verify: Running or not
```bash
kubectl get pods
```
You should see something like:
grafana-xxxxxxxxx-xxxxx
---

## 📊 Access Prometheus

```bash
kubectl port-forward svc/prometheus-server 9090:80
```

Open:

```text
http://localhost:9090
```

---

## 📈 Access Grafana

Get Admin Password:

```bash
kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 -d

echo
```

Start Port Forward:

```bash
kubectl port-forward svc/grafana 3000:80
```

Open:

```text
http://localhost:3000
```

Login:

```text
Username: admin
Password: <command output password>
```

---

## 🔗 Connect Grafana to Prometheus

Data Source URL:

```text
http://prometheus-server
```

Click:

```text
Connections → Data Sources → Prometheus → Save & Test
```

---

## 📊 Import Dashboard

Dashboard ID:

```text
1860
```

Steps:

```text
Dashboards → Import → Enter 1860 → Load → Import
```

---

## 🎯 Outcome

Successfully integrated Prometheus and Grafana with Kubernetes and visualized:

* CPU Usage
* Memory Usage
* Disk Usage
* System Load
* Node Uptime
* Kubernetes Node Metrics

---


