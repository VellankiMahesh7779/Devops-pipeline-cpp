# ✅ Day 1 - Kubernetes Fundamentals (Part 1)

## What is Kubernetes?

Kubernetes is an **open-source container orchestration platform** used to deploy, manage, scale, and maintain containerized applications.

It helps us automatically manage containers instead of managing them manually.

### Real-Time Example

Suppose an e-commerce application has a backend running in multiple containers.

```text
                Backend Application
                       |
          ┌────────────┼────────────┐
          ↓            ↓            ↓
       Backend-1    Backend-2    Backend-3
```

If one backend container crashes, Kubernetes can create a replacement automatically.

```text
Backend-1  ✅
Backend-2  ❌
Backend-3  ✅
             ↓
        Kubernetes
             ↓
     Replacement Container
```

---

## Why Use Kubernetes?

* Manage multiple containers automatically.
* Restart failed applications.
* Scale applications when traffic increases.
* Deploy applications across multiple machines.
* Perform application updates and rollbacks.
* Manage application networking.
* Maintain the required number of application instances.

### Simple Example

If we require 3 backend instances:

```text
Backend-1  ✅
Backend-2  ✅
Backend-3  ✅
```

If one fails:

```text
Backend-1  ✅
Backend-2  ❌
Backend-3  ✅
             ↓
        Kubernetes
             ↓
      Creates replacement
             ↓
Backend-1  ✅
Backend-2  ✅
Backend-3  ✅
```

---

## What is Container Orchestration?

Container orchestration means **automatically managing multiple containers**.

For example, Kubernetes can:

* Start containers.
* Stop containers.
* Restart failed containers.
* Scale containers.
* Manage networking.
* Deploy new versions.

```text
                 Kubernetes
                     |
        ┌────────────┼────────────┐
        ↓            ↓            ↓
      Deploy       Scale        Restart
        ↓            ↓            ↓
    Containers  Containers  Containers
```

### Simple Definition

Container orchestration = Automatically managing multiple containers.

---

## Docker vs Kubernetes

### Docker

Docker is mainly used to **build and run containers**.

```text
Application
     ↓
Docker Image
     ↓
Container
```

Example:

```bash
docker run nginx
```

### Kubernetes

Kubernetes is used to **manage containerized applications**.

```text
Kubernetes
    |
    ├── Deploy
    ├── Scale
    ├── Restart
    ├── Network
    └── Update
```

### Simple Difference

Docker → Runs containers
Kubernetes → Manages containerized applications

Docker and Kubernetes can be used together.

---

## What is a Container?

A container is an **isolated environment where an application runs with everything it needs**.

For example, a C++ application may need:

* Application code
* Libraries
* Dependencies
* Runtime

These can be packaged into a container.

```text
C++ Application
      +
Libraries
      +
Dependencies
      ↓
   Container
```

### Simple Definition

Container = A package/environment used to run an application consistently.

---

## What is a Kubernetes Cluster?

A Kubernetes Cluster is a **group of machines managed by Kubernetes**.

These machines are called **Nodes**.

```text
              Kubernetes Cluster
                     |
          ┌──────────┼──────────┐
          ↓          ↓          ↓
        Node 1     Node 2     Node 3
```

A Kubernetes Cluster mainly contains:

```text
Kubernetes Cluster
       |
       ├── Control Plane
       |
       └── Worker Nodes
```

### Simple Definition

Cluster = A group of machines managed by Kubernetes.

---

## What is a Node?

A Node is a **machine inside a Kubernetes Cluster**.

A Node can be:

* Physical server
* Virtual machine
* Cloud server

### AWS Example

An EC2 instance can be used as a Kubernetes Worker Node.

```text
AWS
 ↓
EC2 Instance
 ↓
Worker Node
 ↓
Pods
```

### Simple Definition

Node = A machine that belongs to a Kubernetes Cluster.

---
