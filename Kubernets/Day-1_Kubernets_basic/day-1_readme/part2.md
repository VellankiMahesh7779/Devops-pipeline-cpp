# ☸️ Kubernetes Day 1 — Part 2

## Pods, kubectl & YAML

---

# 1. What is a Pod?

### Definition

A **Pod is the smallest deployable unit in Kubernetes**.

Kubernetes does not normally run a container directly. Instead:

```text
Kubernetes
    ↓
   Pod
    ↓
Container
    ↓
Application
```

### Why do we need a Pod?

A Pod provides an environment for Kubernetes to run and manage containers.

A Pod provides:

* Networking
* Storage
* Container lifecycle management
* A shared environment for containers

### Real-World Example

Imagine an e-commerce application:

```text
E-Commerce Application
        ↓
    Backend Pod
        ↓
 Backend Container
        ↓
 Python / Java Application
```

Kubernetes manages the **Pod**, while the application runs inside the container.

### Simple Example

```text
Pod
 │
 └── Nginx Container
```

> **Pod = Kubernetes' smallest unit for running an application.**

---

# 2. Pod vs Container

This is an important concept.

### Container

A **container packages and runs an application**.

Example:

```text
Nginx Container
      ↓
   Nginx App
```

### Pod

A **Pod is the Kubernetes unit that contains one or more containers**.

```text
Pod
 │
 └── Nginx Container
```

### Easy Difference

```text
Container → Runs the application

Pod → Kubernetes unit that runs/contains the container
```

---

# 3. Can a Pod Have Multiple Containers?

Yes.

A Pod can contain **one or more containers**.

```text
Pod
│
├── Main Application Container
└── Sidecar Container
```

### Real-World Example

Suppose an application generates logs.

```text
Application Container
        │
        │ Logs
        ▼
Sidecar Container
        │
        ▼
Logging System
```

The application and logging sidecar can work closely together because they are in the same Pod.

### Other Examples

```text
Application + Logging Agent
Application + Monitoring Agent
Application + Proxy
```

### Important

Most normal applications use:

```text
1 Pod
  ↓
1 Main Container
```

Multiple containers are useful when the containers need to work closely together.

---

# 4. Pod Network

Every Pod normally gets its own IP address.

Example:

```text
Pod 1 → 10.244.1.5
Pod 2 → 10.244.1.6
Pod 3 → 10.244.1.7
```

Pods can communicate with other Pods through the Kubernetes network.

### But there is a problem

Pod IPs are **not permanent**.

Example:

```text
Old Pod
10.244.1.5
    ↓
Pod deleted
    ↓
New Pod
10.244.1.9
```

The new Pod may receive a different IP.

### Why is this important?

Suppose:

```text
Frontend → Backend Pod IP
```

If the Backend Pod is recreated and its IP changes, the Frontend can no longer use the old IP.

That's why Kubernetes provides **Services**.

```text
Frontend
   ↓
Backend Service
   ↓
Backend Pods
```

We will learn Services in **Day 3**.

---

# 5. Pod Lifecycle

A Pod can go through different phases.

```text
Pending
   ↓
Running
   ↓
Succeeded / Failed
```

### Pending

The Pod has been created, but the containers have not started successfully yet.

Example:

```text
Pod Created
     ↓
Waiting for resources/image
     ↓
Pending
```

### Running

The Pod has been successfully started.

```text
Pod
 ↓
Container running
 ↓
Running
```

### Succeeded

The Pod's containers completed successfully.

This is common for tasks that run and finish, such as Jobs.

### Failed

The Pod's containers terminated with an error.

---

# 6. What is kubectl?

### Definition

**kubectl** is the command-line tool used to communicate with a Kubernetes cluster.

Think of it as the **CLI for Kubernetes**.

```text
Developer
    │
    ▼
 kubectl
    │
    ▼
API Server
    │
    ▼
Kubernetes Cluster
```

### Real-World Example

You want to know:

> "How many Pods are running?"

Instead of checking every Worker Node manually:

```bash
kubectl get pods
```

Kubernetes returns the information.

---

# 7. Important kubectl Commands

## Check Worker Nodes

```bash
kubectl get nodes
```

Example:

```text
NAME       STATUS   ROLES
worker-1   Ready    <none>
worker-2   Ready    <none>
```

This tells us which Worker Nodes are available.

---

## Check Pods

```bash
kubectl get pods
```

Example:

```text
NAME     READY   STATUS    RESTARTS
nginx    1/1     Running   0
```

Meaning:

```text
nginx
 ↓
1 container
 ↓
1 container ready
 ↓
Running
```

---

## Get detailed information

```bash
kubectl describe pod nginx
```

This is very useful when a Pod has a problem.

Example:

```text
Pod
 ↓
Pending
 ↓
kubectl describe pod
 ↓
Check Events
 ↓
Find the problem
```

---

## View application logs

```bash
kubectl logs nginx
```

### Real-World Example

Suppose your application is running but returning errors.

You can check its logs:

```bash
kubectl logs <pod-name>
```

This helps you understand what the application is doing or why it failed.

---

## Execute a command inside a Pod

```bash
kubectl exec -it <pod-name> -- /bin/bash
```

This allows you to open a shell inside the container.

```text
Developer
    ↓
kubectl exec
    ↓
Pod
    ↓
Container Shell
```

Example:

```bash
kubectl exec -it nginx -- /bin/bash
```

Now you can inspect the container from inside.

---

# 8. What is YAML?

### Definition

**YAML is a human-readable configuration format used to define Kubernetes resources.**

Instead of creating everything using many commands, we can describe what we want in a YAML file.

Example:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: nginx

spec:
  containers:
    - name: nginx
      image: nginx
```

---

# 9. Why Do We Use YAML?

Imagine a real application with:

```text
Frontend
Backend
Database
Services
ConfigMaps
Secrets
Volumes
```

Creating and managing everything manually with commands becomes difficult.

Instead, we define the configuration in files.

```text
YAML Files
    ↓
kubectl apply
    ↓
Kubernetes
    ↓
Resources Created
```

### Real-World Example

A DevOps team can store Kubernetes YAML files in Git:

```text
kubernetes/
│
├── frontend.yaml
├── backend.yaml
├── database.yaml
├── service.yaml
└── configmap.yaml
```

This gives us:

* Version control
* Code review
* Easy modification
* Reusability
* CI/CD integration

---

# 10. Understanding Kubernetes YAML

A basic Kubernetes YAML commonly contains:

```text
apiVersion
kind
metadata
spec
```

Let's understand each one.

---

## apiVersion

Defines which Kubernetes API version the resource uses.

Example:

```yaml
apiVersion: v1
```

For a basic Pod, `v1` is used.

---

## kind

Defines **what Kubernetes resource we want to create**.

Example:

```yaml
kind: Pod
```

This means:

> "I want to create a Pod."

Later we will use:

```yaml
kind: Deployment
```

and:

```yaml
kind: Service
```

---

## metadata

Contains information about the resource.

Example:

```yaml
metadata:
  name: nginx
```

This gives the Pod the name:

```text
nginx
```

---

## spec

`spec` defines the **desired configuration** of the resource.

Example:

```yaml
spec:
  containers:
    - name: nginx
      image: nginx
```

It tells Kubernetes:

> "I want an nginx container running inside this Pod."

---

# 11. Complete Pod YAML Example

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: nginx

spec:
  containers:
    - name: nginx
      image: nginx
```

### What are we saying?

```text
apiVersion
    ↓
Use Kubernetes v1 API

kind
    ↓
Create a Pod

metadata
    ↓
Name it nginx

spec
    ↓
Run an nginx container
```

---

# 12. How YAML Becomes a Pod

Suppose we save the file as:

```text
pod.yaml
```

Run:

```bash
kubectl apply -f pod.yaml
```

Flow:

```text
pod.yaml
    ↓
kubectl apply
    ↓
API Server
    ↓
Kubernetes
    ↓
Pod Created
    ↓
Container Starts
```

Check the Pod:

```bash
kubectl get pods
```

---

# 13. What Does `kubectl apply` Mean?

### Definition

`kubectl apply` tells Kubernetes:

> **"Make the cluster match the configuration defined in this YAML file."**

Example:

```bash
kubectl apply -f pod.yaml
```

If the Pod doesn't exist:

```text
YAML
 ↓
Pod doesn't exist
 ↓
Create Pod
```

If the resource already exists and its configuration changes:

```text
YAML
 ↓
Compare configuration
 ↓
Update resource if required
```

This is called **declarative management**.

---

# 14. Imperative vs Declarative

## Imperative

You tell Kubernetes **what action to perform**.

Example:

```bash
kubectl run nginx --image=nginx
```

Meaning:

> "Create/run an nginx Pod."

Think:

```text
Imperative
    ↓
DO THIS
```

---

## Declarative

You define **what you want the final state to look like**.

Example:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: nginx

spec:
  containers:
    - name: nginx
      image: nginx
```

Then:

```bash
kubectl apply -f pod.yaml
```

Think:

```text
Declarative
    ↓
I WANT THIS STATE
```

### Easy Difference

```text
Imperative
    ↓
"Run this command."

Declarative
    ↓
"Make the cluster look like this."
```

---

# 15. What is Desired State?

### Definition

**Desired state is the condition that we want Kubernetes to maintain.**

Example:

```text
I want 3 Pods running.
```

Kubernetes continuously compares:

```text
Desired State
      vs
Actual State
```

### Real-World Example

Suppose:

```text
Desired State = 3 Pods
Actual State  = 2 Pods
```

Kubernetes works to fix the difference:

```text
Desired = 3
Actual  = 2
    ↓
Kubernetes
    ↓
Creates another Pod
    ↓
Desired = 3
Actual  = 3
```

This is a core idea behind Kubernetes.

---

# 16. Practical Example — Create an Nginx Pod

## Step 1 — Create YAML

Create a file:

```text
pod.yaml
```

Add:

```yaml
apiVersion: v1
kind: Pod

metadata:
  name: nginx

spec:
  containers:
    - name: nginx
      image: nginx
```

---

## Step 2 — Create the Pod

```bash
kubectl apply -f pod.yaml
```

---

## Step 3 — Check the Pod

```bash
kubectl get pods
```

Example output:

```text
NAME     READY   STATUS    RESTARTS
nginx    1/1     Running   0
```

---

## Step 4 — Get Details

```bash
kubectl describe pod nginx
```

---

## Step 5 — Check Logs

```bash
kubectl logs nginx
```

---

## Step 6 — Enter the Container

```bash
kubectl exec -it nginx -- /bin/bash
```

---

## Step 7 — Delete the Pod

```bash
kubectl delete -f pod.yaml
```

---

# 17. Important kubectl Commands — Quick Reference

```bash
# Check cluster nodes
kubectl get nodes

# Check Pods
kubectl get pods

# Get detailed Pod information
kubectl describe pod <pod-name>

# View Pod logs
kubectl logs <pod-name>

# Enter a container
kubectl exec -it <pod-name> -- /bin/bash

# Create/update from YAML
kubectl apply -f <file>.yaml

# Delete resource
kubectl delete -f <file>.yaml

# Show all common resources
kubectl get all
```

---

# 18. Day 1 Complete Flow

```text
                    Kubernetes Cluster
                           │
                    Control Plane
                           │
                      API Server
                           │
                    ┌──────┴──────┐
                    │             │
                 kubectl        YAML
                    │             │
                    └──────┬──────┘
                           ▼
                          Pod
                           │
                           ▼
                       Container
                           │
                           ▼
                      Application
```

---

# 🧠 Quick Revision

| Topic             | Simple Definition                      | Example            |
| ----------------- | -------------------------------------- | ------------------ |
| **Pod**           | Smallest deployable unit in Kubernetes | Nginx Pod          |
| **Container**     | Runs the application                   | Nginx container    |
| **Pod IP**        | IP assigned to a Pod                   | `10.244.1.5`       |
| **kubectl**       | CLI for Kubernetes                     | `kubectl get pods` |
| **YAML**          | Defines Kubernetes resources           | `pod.yaml`         |
| **apiVersion**    | API version of resource                | `v1`               |
| **kind**          | Type of resource                       | `Pod`              |
| **metadata**      | Resource information                   | Pod name           |
| **spec**          | Desired configuration                  | Container/image    |
| **Imperative**    | Tell Kubernetes what action to perform | `kubectl run`      |
| **Declarative**   | Define desired final state             | YAML + `apply`     |
| **Desired State** | What we want Kubernetes to maintain    | 3 Pods running     |

---

# 🎯 Day 1 Part 2 — What You Should Know

By the end of Part 2, you should be able to explain:

```text
What is a Pod?
       ↓
Pod vs Container
       ↓
Can a Pod have multiple containers?
       ↓
How does Pod networking work?
       ↓
What is Pod lifecycle?
       ↓
What is kubectl?
       ↓
What are common kubectl commands?
       ↓
What is YAML?
       ↓
Why do we use YAML?
       ↓
What are apiVersion, kind, metadata and spec?
       ↓
What is kubectl apply?
       ↓
Imperative vs Declarative
       ↓
What is Desired State?
```

# ⭐ Most Important Concept

Remember this flow:

```text
You define what you WANT
          ↓
       YAML file
          ↓
    kubectl apply
          ↓
      API Server
          ↓
      Kubernetes
          ↓
         Pod
          ↓
      Container
          ↓
     Application
```

And Kubernetes continuously tries to make:

```text
DESIRED STATE = ACTUAL STATE
```

