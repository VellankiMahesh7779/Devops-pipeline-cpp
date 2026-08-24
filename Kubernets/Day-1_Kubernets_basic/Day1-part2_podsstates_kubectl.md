# ✅ Day 1 - Kubernetes Fundamentals (Part 2)

## What is a Pod?

A Pod is the **smallest deployable unit in Kubernetes**.

For beginner understanding:

```text
Pod
 |
Container
 |
Application
```

Example:

```text
Pod
 |
Nginx Container
 |
Nginx Application
```

A Pod can contain one or more containers, but normally a simple application starts with one main container per Pod.

### Important

Kubernetes normally manages **Pods**, rather than directly managing individual containers.

```text
Kubernetes
    ↓
   Pod
    ↓
Container
    ↓
Application
```

### Simple Definition

Pod = The basic unit Kubernetes uses to run an application.

---

## Why Does Kubernetes Use Pods?

Kubernetes uses Pods as the basic unit for:

* Running containers.
* Managing application lifecycle.
* Giving applications networking.
* Scheduling applications onto Nodes.

```text
Kubernetes
     ↓
    Pod
     ↓
Container
     ↓
Application
```

---

## What is Desired State?

Desired State means **what we want Kubernetes to maintain**.

For example:

I want 3 backend Pods.

```text
Desired State = 3 Pods
```

---

## What is Actual State?

Actual State means **what is currently running in the cluster**.

For example:

```text
Desired State = 3
Actual State  = 2
```

Kubernetes checks the difference and tries to correct it.

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

### Important Concept

Kubernetes continuously tries to make the Actual State match the Desired State.

---

## What is Declarative Approach?

Declarative means **telling Kubernetes what we want instead of telling it every step to perform**.

For example:

```text
"I want 3 backend Pods."
```

We don't manually create all 3 Pods.

Kubernetes decides how to achieve the desired state.

```text
Desired State
     ↓
Kubernetes
     ↓
Creates / Manages Pods
```

Kubernetes YAML files are commonly used for the declarative approach.

### Simple Definition

Declarative = Tell Kubernetes WHAT you want.

---

## What is Imperative Approach?

Imperative means **telling Kubernetes exactly what action to perform**.

Example:

```bash
kubectl run nginx --image=nginx
```

This directly tells Kubernetes:

Create an nginx Pod.

### Simple Definition

Imperative = Tell Kubernetes WHAT ACTION to perform.

### Difference

```text
Imperative
    ↓
Do this action

Declarative
    ↓
Maintain this desired state
```

---

## What is kubectl?

`kubectl` is the **command-line tool used to communicate with and manage Kubernetes**.

Example:

```bash
kubectl get nodes
```

This means:

Show me the Nodes in the Kubernetes Cluster.

Another example:

```bash
kubectl get pods
```

This means:

Show me the Pods.

### Basic Flow

```text
You
 ↓
kubectl
 ↓
Kubernetes
```

The detailed API Server flow will be covered in Part 2 (of the original course).

### Simple Definition

kubectl = Command-line tool used to communicate with Kubernetes.

---

**Next → Part 3: Kubernetes Objects, Namespaces, Hands-On & Revision**