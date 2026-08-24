# ✅ Day 1 - Kubernetes Fundamentals (Part 3)

## What is a Kubernetes Object?

A Kubernetes Object is a **resource managed by Kubernetes**.

Examples:

* Pod
* Deployment
* Service
* ConfigMap
* Secret
* Namespace

For example:

```bash
kubectl get pods
```

Here, the Pods are Kubernetes Objects.

### Simple Definition

> Kubernetes Object = A resource that Kubernetes manages.

---

## What is a Namespace?

A Namespace is used to **logically separate resources inside a Kubernetes Cluster**.

### Real-Time Example

A company may have different environments:

```text
Development
Testing
Production
```

We can separate them using Namespaces:

```text
Kubernetes Cluster
       |
       ├── dev
       |    └── Application Pods
       |
       ├── test
       |    └── Application Pods
       |
       └── prod
            └── Application Pods
```

For example:

```bash
kubectl get namespaces
```

### Simple Definition

> Namespace = Logical separation of resources inside a Kubernetes Cluster.

---

## Real-World Kubernetes Picture

Suppose an e-commerce company has a backend application.

```text
                 Kubernetes Cluster
                        |
              ┌─────────┴─────────┐
              ↓                   ↓
        Control Plane        Worker Nodes
          Manages               Run Apps
                                  |
                                 Pods
                                  |
                              Containers
                                  |
                              Backend
```

The Control Plane manages the cluster, while Worker Nodes run the application.

---

## Day 1 Hands-On

Use Minikube for practice.

```bash
minikube status

kubectl cluster-info

kubectl get nodes

kubectl get namespaces

kubectl run nginx --image=nginx

kubectl get pods

kubectl get pods -o wide

kubectl describe pod nginx

kubectl logs nginx

kubectl exec -it nginx -- /bin/bash

exit

kubectl delete pod nginx
```

---

## Day 1 - Quick Revision

| Topic                   | Simple Meaning                                 |
| ----------------------- | ----------------------------------------------- |
| Kubernetes              | Manages containerized applications             |
| Container               | Environment used to run an application         |
| Container Orchestration | Managing multiple containers automatically     |
| Cluster                 | Group of machines managed by Kubernetes        |
| Node                    | Machine inside a Kubernetes Cluster            |
| Pod                     | Basic unit Kubernetes uses to run applications |
| Desired State           | What we want                                   |
| Actual State            | What is currently running                      |
| Declarative             | Tell Kubernetes what you want                  |
| Imperative              | Tell Kubernetes what action to perform         |
| kubectl                 | Command-line tool for Kubernetes               |
| Kubernetes Object       | Resource managed by Kubernetes                 |
| Namespace               | Logical separation of resources                |

---

## ✅ Day 1 Completed

* What Kubernetes is.
* Why Kubernetes is needed.
* What container orchestration means.
* Docker vs Kubernetes.
* What a Cluster is.
* What a Node is.
* What a Pod is.
* Desired State vs Actual State.
* Declarative vs Imperative approach.
* What kubectl is.
* What Kubernetes Objects are.
* What Namespaces are.