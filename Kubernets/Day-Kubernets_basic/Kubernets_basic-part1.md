# ✅ Day 1 - Kubernetes Part 1 - Basics

## What is Kubernetes?

Kubernetes is an **open-source platform used to deploy, manage, scale, and maintain containerized applications**.

In simple words, Kubernetes helps us manage many containers automatically.

### Real-Time Example

Suppose an e-commerce application has 3 backend containers. If one container crashes, Kubernetes can automatically replace it.

### Flow

                    E-Commerce Application
                             ↓
                        Kubernetes
                             ↓
              ┌──────────────┼──────────────┐
              ↓              ↓              ↓
          Backend-1      Backend-2      Backend-3
                             ↓
                      Container Fails
                             ↓
                        Kubernetes
                             ↓
                    Replacement Created

### Simple Definition

> Kubernetes is a platform that automatically manages containerized applications.

## Why Use Kubernetes?

When we have only a few containers, we can manage them manually.

When an application has hundreds or thousands of containers, manual management becomes difficult.

Kubernetes helps us:

- Deploy applications automatically.
- Restart failed containers.
- Scale applications.
- Manage containers across multiple servers.
- Manage networking.
- Perform updates and rollbacks.

### Real-Time Example

During an online sale, application traffic increases.

### Flow

Normal Traffic
      ↓
3 Backend Containers
      ↓
High Traffic
      ↓
Kubernetes
      ↓
More Backend Containers
      ↓
Application Handles More Users

### Simple Definition

> Kubernetes is used to automatically manage applications when managing containers manually becomes difficult.

## What is Container Orchestration?

Container orchestration means **automatically managing the lifecycle of multiple containers**.

Kubernetes can:

- Create containers.
- Start containers.
- Stop containers.
- Restart failed containers.
- Scale containers.
- Update applications.

### Real-Time Example

Imagine a company has 500 containers.

Instead of manually managing every container, Kubernetes manages them automatically.

### Flow

                  500 Containers
                        ↓
                   Kubernetes
                        ↓
        ┌───────────────┼───────────────┐
        ↓               ↓               ↓
      Deploy           Scale          Restart
        ↓               ↓               ↓
   Applications    More Instances    Failed Apps

### Simple Definition

> Container orchestration means automatically managing multiple containers.

## What is a Container?

A container is an **isolated environment used to run an application with everything it needs to work**.

A container can include:

- Application code.
- Libraries.
- Dependencies.
- Runtime.

### Real-Time Example

Suppose a Python application needs Python and several libraries.

Instead of installing everything manually on every server, we package the application and its dependencies inside a container.

### Flow

                  Python Application
                         ↓
              ┌──────────┼──────────┐
              ↓          ↓          ↓
           Code       Libraries   Dependencies
              └──────────┼──────────┘
                         ↓
                     Container
                         ↓
              Development → Testing
                         ↓
                     Production

### Simple Definition

> A container is a package that contains an application and its required dependencies so it can run consistently.

## Docker vs Kubernetes

Docker and Kubernetes are related, but they have different responsibilities.

**Docker** is mainly used to build and run containers.

**Kubernetes** is used to manage containerized applications at scale.

### Docker Flow

              Application
                   ↓
               Dockerfile
                   ↓
               Docker Image
                   ↓
                Container

### Kubernetes Flow

                Containers
                     ↓
                Kubernetes
                     ↓
          ┌──────────┼──────────┐
          ↓          ↓          ↓
        Deploy      Scale     Restart
          ↓          ↓          ↓
      Application  Instances  Failed Apps

### Real-Time Example

Docker can run a container.

But imagine an application with:

- 100 backend containers.
- 50 frontend containers.
- 20 payment containers.

Managing all these containers manually becomes difficult.

Kubernetes can manage them automatically.

### Simple Difference

> **Docker → Builds and runs containers.**

> **Kubernetes → Manages containerized applications.**

## What is a Kubernetes Cluster?

A Kubernetes Cluster is a **group of machines managed by Kubernetes**.

These machines are called **Nodes**.

A Kubernetes Cluster mainly contains:

- Control Plane.
- Worker Nodes.

### Flow

                    Kubernetes Cluster
                            ↓
             ┌──────────────┴──────────────┐
             ↓                             ↓
       Control Plane                 Worker Nodes
             ↓                             ↓
       Manages Cluster                  Pods
                                           ↓
                                      Containers
                                           ↓
                                      Applications

### Real-Time Example

Suppose a company has 3 servers.

Server-1 ─┐
Server-2 ─┼──→ Kubernetes Cluster
Server-3 ─┘

Kubernetes manages these servers together as one cluster.

### Simple Definition

> A Kubernetes Cluster is a group of machines that are managed together by Kubernetes.

## What is a Node?

A Node is a **machine inside a Kubernetes Cluster**.

A Node can be:

- Physical server.
- Virtual machine.
- Cloud server.

A Node provides resources such as:

- CPU.
- Memory.
- Storage.
- Network.

These resources are used to run applications.

### AWS Real-Time Example

An EC2 instance can be used as a Kubernetes Node.

### Flow

                         AWS
                          ↓
                    EC2 Instance
                          ↓
                  Kubernetes Node
                          ↓
                         Pod
                          ↓
                      Container
                          ↓
                     Application

### Simple Definition

> A Node is a machine inside a Kubernetes Cluster that provides resources to run applications.

## Part 1 Learning Outcome

✔ Learned what Kubernetes is.  
✔ Understood why Kubernetes is needed.  
✔ Learned what container orchestration means.  
✔ Learned what a container is.  
✔ Understood the difference between Docker and Kubernetes.  
✔ Learned what a Kubernetes Cluster is.  
✔ Learned what a Node is.