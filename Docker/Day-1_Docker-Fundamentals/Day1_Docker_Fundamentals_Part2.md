# 📅 Day 1 - Docker Fundamentals (Part 2)

## 📚 Topics Covered

* Docker Client
* Docker Daemon
* Docker Engine
* Docker Hub
* Docker Image vs Container
* Docker Lifecycle
* Installing Docker

---

## 1. Docker Client

The Docker Client is the command-line interface used to communicate with Docker.

**Real-Time Example:**
Like a waiter taking your order and passing it to the kitchen.

---

## 2. Docker Daemon

The Docker Daemon performs Docker operations such as creating, starting, stopping, and deleting containers.

**Real-Time Example:**
Like the chef who prepares your food after receiving the order.

---

## 3. Docker Engine

Docker Engine is the core platform that includes the Docker Client, Docker Daemon, and REST API.

**Real-Time Example:**
Like the entire restaurant where customers place orders and chefs prepare food.

---

## 4. Docker Hub

Docker Hub is an online repository used to store and download Docker images.

**Real-Time Example:**
Just as GitHub stores source code, Docker Hub stores ready-to-use Docker images like Nginx, MySQL, and Jenkins.

---

## 5. Docker Image vs Container

* **Image:** A read-only blueprint used to create containers.
* **Container:** A running instance of an image.

**Real-Time Example:**
A house blueprint is an image, while the constructed house is the container.

---

## 6. Docker Lifecycle

A Docker application moves through the stages of image creation, container creation, execution, stopping, restarting, and removal.

**Real-Time Example:**
Like a car moving through manufacturing, delivery, driving, parking, restarting, and finally being scrapped.

---

## 7. Installing Docker

Docker is installed on the host machine to create and manage containers.

**On Ubuntu:**

sudo apt update
sudo apt install docker.io -y

Start Docker:
sudo systemctl start docker

Enable Docker after reboot:
sudo systemctl enable docker

Check the version:
docker version

Verify Docker is working:
docker run hello-world

**Real-Time Example:**
Before driving a car, you must first have the engine installed. Similarly, Docker must be installed before creating or running containers.
