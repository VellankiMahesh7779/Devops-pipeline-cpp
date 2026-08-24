# ☸️ Kubernetes Day 1 — Part 1

## Kubernetes Basics & Architecture

---

# 1. What is Kubernetes?

### Definition

**Kubernetes (K8s)** is an open-source **container orchestration platform** used to deploy, manage, scale, and maintain containers automatically.

### Simple Definition

> **Kubernetes manages containers automatically.**

### Why do we need Kubernetes?

Running a few containers with Docker is easy.

But imagine a real company application with:

```text
Frontend → 5 Containers
Backend  → 10 Containers
Database → 2 Containers
```

Now imagine some containers crash, traffic increases, or a new version needs to be deployed.

Managing everything manually becomes difficult.

Kubernetes helps automate these tasks.

### Kubernetes can:

* Deploy containers
* Restart failed containers
* Scale applications
* Distribute traffic
* Perform updates
* Manage application workloads

### Real-World Example

Suppose an online shopping application has:

```text
              E-Commerce App
                    │
        ┌───────────┼───────────┐
        ▼           ▼           ▼
     Frontend     Backend     Database
      Pods         Pods         Pod
```

During a festival sale, traffic increases.

Kubernetes can increase the number of application instances:

```text
Normal Traffic

Backend
 ├── Pod 1
 └── Pod 2


High Traffic

Backend
 ├── Pod 1
 ├── Pod 2
 ├── Pod 3
 ├── Pod 4
 └── Pod 5
```

---

# 2. What is Container Orchestration?

### Definition

**Container orchestration** means automatically managing multiple containers.

It includes tasks such as:

```text
Deploy
Scale
Network
Restart
Update
Monitor
```

### Simple Example

Suppose we have 100 containers.

Without orchestration:

```text
Developer
   │
   ├── Start containers
   ├── Restart failed containers
   ├── Manage networking
   ├── Scale containers
   └── Update containers
```

With Kubernetes:

```text
Developer
    │
    ▼
Kubernetes
    │
    ├── Deploy
    ├── Scale
    ├── Restart
    ├── Network
    └── Update
```

> **Kubernetes is one of the most widely used container orchestration platforms.**

---

# 3. Why Do We Need Kubernetes?

Docker can run containers, but Docker alone does not provide everything needed to easily manage a large production environment.

### Example

Suppose your application has 3 backend containers:

```text
Backend
 ├── Container 1
 ├── Container 2
 └── Container 3
```

Container 2 crashes.

### Without Kubernetes

```text
Container 2 crashes
       ↓
Developer notices
       ↓
Developer restarts it
```

### With Kubernetes

```text
Container crashes
       ↓
Kubernetes detects it
       ↓
Kubernetes replaces/restarts it
       ↓
Application becomes available
```

### Kubernetes provides:

| Feature               | Purpose                                   |
| --------------------- | ----------------------------------------- |
| **Self-Healing**      | Restarts/replaces failed workloads        |
| **Scaling**           | Increases/decreases application instances |
| **Load Balancing**    | Distributes traffic                       |
| **Rolling Updates**   | Updates applications gradually            |
| **Service Discovery** | Helps applications find each other        |
| **Scheduling**        | Decides where workloads should run        |

---

# 4. What is a Kubernetes Cluster?

### Definition

A **Kubernetes Cluster is a group of machines managed by Kubernetes**.

A cluster contains:

```text
Kubernetes Cluster
│
├── Control Plane
│
├── Worker Node 1
├── Worker Node 2
└── Worker Node 3
```

### Simple Example

Think of a company.

```text
Manager
   │
   ├── Employee 1
   ├── Employee 2
   └── Employee 3
```

Similarly:

```text
Control Plane
      │
      ├── Worker Node 1
      ├── Worker Node 2
      └── Worker Node 3
```

The Control Plane manages the cluster, while Worker Nodes run application workloads.

---

# 5. What is the Control Plane?

### Definition

The **Control Plane is the brain of the Kubernetes cluster**.

It makes decisions and manages the desired state of the cluster.

```text
Control Plane
│
├── API Server
├── Scheduler
├── Controller Manager
└── etcd
```

### Real-World Example

Imagine a manager who decides:

```text
We need 3 backend instances.
```

The manager tells the workers what needs to be done.

Similarly:

```text
Developer
   ↓
Control Plane
   ↓
Worker Nodes
   ↓
Application Pods
```

### Main responsibilities

* Accept requests
* Schedule workloads
* Maintain desired state
* Store cluster information
* Manage Worker Nodes

---

# 6. What is the API Server?

### Definition

The **API Server is the main communication point of Kubernetes**.

Almost every interaction with Kubernetes goes through the API Server.

```text
Developer
    │
    │ kubectl
    ▼
API Server
    │
    ▼
Kubernetes Cluster
```

### Real-World Example

You run:

```bash
kubectl get pods
```

The flow is:

```text
kubectl get pods
       ↓
   API Server
       ↓
 Kubernetes
       ↓
Pod information
       ↓
   Terminal
```

### Simple Definition

> **API Server = Main entry point for communicating with Kubernetes.**

---

# 7. What is the Scheduler?

### Definition

The **Scheduler decides which Worker Node should run a new Pod**.

It considers things such as:

* Available resources
* CPU
* Memory
* Scheduling rules
* Node conditions

### Example

Suppose we have:

```text
Worker Node 1 → CPU almost full
Worker Node 2 → Available
Worker Node 3 → Available
```

A new Pod needs to run.

```text
New Pod
   ↓
Scheduler
   ↓
Checks Nodes
   ↓
Selects Node 2
   ↓
Pod runs on Node 2
```

### Simple Definition

> **Scheduler = Decides where a Pod should run.**

---

# 8. What is the Controller Manager?

### Definition

The **Controller Manager continuously checks the actual state of the cluster and works to match the desired state**.

This is a very important Kubernetes concept.

### Example

You want:

```text
Desired State = 3 Pods
```

But currently:

```text
Actual State = 2 Pods
```

Kubernetes detects the difference.

```text
Desired = 3
Actual  = 2
    ↓
Controller
    ↓
Creates another Pod
    ↓
Desired = 3
Actual  = 3
```

### Simple Definition

> **Controller Manager = Keeps the cluster in the desired state.**

---

# 9. What is etcd?

### Definition

**etcd is the key-value database used by Kubernetes to store important cluster information and state.**

It stores information such as:

* Cluster configuration
* Desired state
* Kubernetes resource information
* Cluster state

### Real-World Example

Suppose you tell Kubernetes:

```text
I want 3 replicas of my application.
```

Kubernetes needs to store this desired configuration.

The cluster state is stored in **etcd**.

```text
Desired Configuration
        ↓
      etcd
        ↓
Kubernetes Cluster
```

### Simple Definition

> **etcd = Stores Kubernetes cluster state and configuration.**

---

# 10. What is a Worker Node?

### Definition

A **Worker Node is a machine where application workloads run**.

```text
Worker Node
│
├── kubelet
├── kube-proxy
└── Pods
    ├── Frontend Pod
    ├── Backend Pod
    └── Database Pod
```

### Real-World Example

Suppose we have:

```text
Worker Node 1
 ├── Frontend Pod
 └── Backend Pod

Worker Node 2
 ├── Backend Pod
 └── Database Pod
```

The application workloads actually run on the Worker Nodes.

### Simple Definition

> **Worker Node = Machine that runs application Pods.**

---

# 11. What is kubelet?

### Definition

**kubelet is an agent that runs on every Worker Node.**

Its main job is to make sure the Pods assigned to that Worker Node are running correctly.

```text
Control Plane
      │
      │ Instructions
      ▼
   kubelet
      │
      ▼
    Pods
```

### Real-World Example

Control Plane says:

```text
Run nginx Pod on Worker Node 1.
```

The kubelet on Node 1 makes sure that the Pod is running.

If there is a problem, kubelet reports the status back to the Control Plane.

### Simple Definition

> **kubelet = Agent that manages Pods on a Worker Node.**

---

# 12. What is kube-proxy?

### Definition

**kube-proxy is a networking component that helps implement Kubernetes Service networking.**

It helps network traffic reach the correct Pods.

```text
Frontend Pod
     │
     ▼
Backend Service
     │
     ▼
kube-proxy / networking rules
     │
     ▼
Backend Pod
```

### Real-World Example

Suppose we have:

```text
Backend Service
      │
 ┌────┼────┐
 ▼    ▼    ▼
Pod  Pod  Pod
```

A request comes to the Service.

Kubernetes networking ensures the request reaches an appropriate Backend Pod.

### Simple Definition

> **kube-proxy = Helps handle network traffic for Kubernetes Services.**

---

# 13. Control Plane vs Worker Node

This is one of the most important Day 1 concepts.

| Control Plane               | Worker Node                              |
| --------------------------- | ---------------------------------------- |
| Manages the cluster         | Runs applications                        |
| Makes decisions             | Runs Pods                                |
| Contains API Server         | Contains kubelet                         |
| Contains Scheduler          | Contains kube-proxy                      |
| Contains Controller Manager | Provides resources for workloads         |
| Contains etcd               | Runs application containers through Pods |

### Easy Way to Remember

```text
Control Plane
     ↓
"WHAT SHOULD HAPPEN?"

Worker Node
     ↓
"RUN THE APPLICATION"
```

---

# 14. Complete Kubernetes Architecture

```text
                         Kubernetes Cluster
                                │
                 ┌──────────────┴──────────────┐
                 │                             │
           Control Plane                 Worker Nodes
                 │                       ┌─────┴─────┐
       ┌─────────┼─────────┐             │           │
       │         │         │          Node 1       Node 2
       ▼         ▼         ▼             │           │
   API Server Scheduler Controller    kubelet     kubelet
                       Manager            │           │
       │                               kube-proxy   kube-proxy
       ▼                                  │           │
      etcd                               Pods        Pods
                                           │           │
                                      Containers   Containers
```

---

# 15. Complete Real-World Example

Imagine an online shopping application.

```text
                    User
                     │
                     ▼
              Kubernetes Cluster
                     │
              ┌──────┴──────┐
              │             │
        Worker Node 1   Worker Node 2
              │             │
          ┌───┴───┐     ┌───┴───┐
          ▼       ▼     ▼       ▼
      Frontend  Backend Backend Database
        Pod       Pod     Pod      Pod
```

Now suppose the Backend Pod crashes.

```text
Backend Pod ❌
     ↓
Kubernetes detects difference
     ↓
Controller works to restore desired state
     ↓
New Backend Pod
     ↓
Application available again
```

The developer does not need to manually SSH into the server and start the application.

---

# 16. How Everything Works Together

```text
Developer
    │
    │ kubectl / YAML
    ▼
API Server
    │
    ▼
Control Plane
    │
    ├── Scheduler
    │      ↓
    │   Chooses Worker Node
    │
    ├── Controller Manager
    │      ↓
    │   Maintains Desired State
    │
    └── etcd
           ↓
      Stores Cluster State
           
              ↓
       Worker Node
              │
       ┌──────┴──────┐
       ▼             ▼
    kubelet       kube-proxy
       │             │
       ▼             ▼
      Pods       Networking
       │
       ▼
   Containers
       │
       ▼
   Applications
```

---

# 🧠 Quick Revision

| Component              | Simple Definition                       | Real-World Role                        |
| ---------------------- | --------------------------------------- | -------------------------------------- |
| **Kubernetes**         | Container orchestration platform        | Manages applications                   |
| **Cluster**            | Group of machines managed by Kubernetes | Complete Kubernetes environment        |
| **Control Plane**      | Brain of the cluster                    | Makes decisions                        |
| **API Server**         | Main communication point                | Receives Kubernetes requests           |
| **Scheduler**          | Decides where Pods run                  | Selects Worker Node                    |
| **Controller Manager** | Maintains desired state                 | Creates/replaces workloads when needed |
| **etcd**               | Kubernetes key-value database           | Stores cluster state                   |
| **Worker Node**        | Machine that runs workloads             | Runs application Pods                  |
| **kubelet**            | Worker Node agent                       | Manages Pods                           |
| **kube-proxy**         | Networking component                    | Helps Service traffic reach Pods       |

---

# 🎯 Day 1 — Part 1 Goal

After completing Part 1, you should be able to explain:

```text
What is Kubernetes?
        ↓
Why do we need Kubernetes?
        ↓
What is Container Orchestration?
        ↓
What is a Cluster?
        ↓
Control Plane vs Worker Node
        ↓
What does API Server do?
        ↓
What does Scheduler do?
        ↓
What does Controller Manager do?
        ↓
What is etcd?
        ↓
What does kubelet do?
        ↓
What does kube-proxy do?
```

## ⭐ Most Important Concept

Remember this:

```text
                 Kubernetes
                     │
             ┌───────┴───────┐
             │               │
       Control Plane      Worker Node
             │               │
       Makes decisions     Runs Pods
             │               │
       "WHAT TO DO?"      "RUN IT"
```

**Day 1 Part 1 = Understand how Kubernetes is built and how the Control Plane manages Worker Nodes.**

