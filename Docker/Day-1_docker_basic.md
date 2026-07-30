# 📅 Day 1 - Docker Fundamentals

## ✅ Topics Covered

* What is Docker?
* Why Docker is used
* Problems before Docker ("It works on my machine")
* What is Containerization?
* Virtual Machine (VM) vs Docker
* Docker Architecture

  * Docker Client
  * Docker Daemon
  * Docker Engine
  * Docker Hub
* Docker Image vs Container
* Docker Lifecycle
* Installing Docker
* Basic Docker Commands

---

## 📖 What I Learned

* Docker is a containerization platform that packages an application along with all its dependencies, making it run consistently across different environments.
* Containers are lightweight, start quickly, and share the host operating system's kernel.
* Docker solves dependency and environment mismatch issues.
* An **Image** is a blueprint (template), while a **Container** is a running instance of that image.
* Docker Hub is a repository used to store and download Docker images.

---

## 🏗 Docker Architecture

```text
Docker Client
      │
      ▼
Docker Daemon
      │
      ▼
Docker Engine
      │
      ▼
Docker Hub
      │
      ▼
Docker Image
      │
      ▼
Docker Container
```

---

## 🔄 Docker Lifecycle

```text
Dockerfile
    │
    ▼
docker build
    │
    ▼
Image
    │
    ▼
docker run
    │
    ▼
Running Container
    │
 ┌──┴──┐
 ▼     ▼
stop  restart
 │
 ▼
start
 │
 ▼
docker rm
```
## 🔄 Easy way to Remember Docker

| Topic            | Remember Like This                                                   |
| ---------------- | -------------------------------------------------------------------- |
| Docker           | A sealed lunch box containing everything the application needs.      |
| Containerization | Packing the application and all dependencies into one portable unit. |
| VM               | Everyone gets a separate house (full OS).                            |
| Docker           | Everyone shares one building but has their own room (shared kernel). |
| Docker Client    | Waiter taking your order.                                            |
| Docker Daemon    | Chef preparing your order.                                           |
| Docker Engine    | The entire restaurant.                                               |
| Docker Hub       | GitHub for Docker images.                                            |
| Image            | Blueprint or recipe.                                                 |
| Container        | Running house or cooked meal.                                        |
| Lifecycle        | Dockerfile → Image → Container → Stop → Start → Remove.              |

---

## 💻 Commands Practiced

```bash
docker version
docker info
docker run hello-world
docker pull ubuntu
docker run -it ubuntu bash
docker images
docker ps
docker ps -a
docker stop <container_id>
docker start <container_id>
docker rm <container_id>
docker rmi <image_id>
```

---

## 🎯 Key Takeaways

* Docker provides a consistent environment for applications.
* Containers are faster and more lightweight than Virtual Machines.
* Images are used to create containers.
* Docker Engine manages images, containers, networks, and volumes.
* Docker is widely used in DevOps CI/CD pipelines and Kubernetes deployments.
