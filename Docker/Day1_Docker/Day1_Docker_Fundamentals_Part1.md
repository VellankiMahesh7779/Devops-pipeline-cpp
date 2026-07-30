# 📅 Day 1 - Docker Fundamentals (Part 1)

## 📚 Topics Covered

* What is Docker?
* Why Docker is Used
* Problems Before Docker ("It works on my machine")
* What is Containerization?
* Virtual Machine (VM) vs Docker
* Docker Architecture

---

## 1. What is Docker?

Docker is a containerization platform that packages an application with all its dependencies, libraries, and configuration so it runs the same in every environment.

**Real-Time Example:**
A developer builds a Java application and sends a Docker image to the DevOps team. The DevOps engineer runs the image directly without installing Java or other dependencies.

---

## 2. Why Docker is Used

Docker provides a consistent environment across Development, Testing, UAT, and Production.

**Real-Time Example:**
An application tested on a developer's laptop runs exactly the same on an AWS EC2 server because both use the same Docker image.

---

## 3. Problems Before Docker

Applications often failed because different servers had different software versions.

**Real-Time Example:**
A developer uses Java 17, but the production server has Java 11. The application fails, leading to the famous issue: **"It works on my machine."**

---

## 4. What is Containerization?

Containerization packages an application with everything it needs into a lightweight container.

**Real-Time Example:**
Like buying a new phone that comes with the charger, cable, and manual in one box, a container includes the application, runtime, libraries, and configuration together.

---

## 5. Virtual Machine (VM) vs Docker

* **Virtual Machine:** Each VM has its own operating system, making it larger and slower.
* **Docker:** Containers share the host operating system's kernel, making them lightweight and fast.

**Real-Time Example:**
A VM is like giving every employee a separate apartment, while Docker is like employees sharing one office building with separate workspaces.

---

## 6. Docker Architecture

Docker follows a client-server architecture where the Docker Client sends requests to the Docker Daemon, which manages images and containers using the Docker Engine.

**Real-Time Example:**
Like ordering food in a restaurant:

* Customer → Docker Client
* Waiter → Sends the order
* Chef → Docker Daemon
* Kitchen → Docker Engine
