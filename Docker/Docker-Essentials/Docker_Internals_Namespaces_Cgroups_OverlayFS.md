# 📘 Docker Internals - How Containers Work

## 📚 Topics Covered

* What are Containers Made Of?
* Namespaces
* Cgroups
* OverlayFS (Union File System)

---

# What are Containers Made Of?

A Docker container is **not a virtual machine**. It is created using Linux kernel features.

The three main technologies behind Docker containers are:

* **Namespaces** → Provide Isolation
* **Cgroups** → Control Resource Usage
* **OverlayFS** → Manage Image Layers

```text
Linux Kernel
     │
     ├── Namespaces → Isolation
     ├── Cgroups → Resource Limits
     └── OverlayFS → Image Layers
```

---

# 1. Namespaces

## What is it?

Namespaces isolate containers from each other. Each container gets its own view of processes, network, hostname, and file system.

### Real-Time Example

A company has three applications:

* Shopping App
* Payment App
* Inventory App

Each application runs in its own container.

The Shopping container cannot see or access the Payment container's processes or files.

**Remember:** **Namespaces = Isolation**

---

# 2. Cgroups (Control Groups)

## What is it?

Cgroups limit and monitor resources such as CPU, Memory, and Disk I/O for each container.

### Real-Time Example

A server has **16 GB RAM** running three applications.

Without Cgroups:

* One container may consume all 16 GB RAM.
* Other applications become slow or crash.

With Cgroups:

* Shopping App → 4 GB
* Payment App → 6 GB
* Inventory App → 6 GB

Each application gets its allocated resources.

**Remember:** **Cgroups = Resource Limits**

---

# 3. OverlayFS (Union File System)

## What is it?

OverlayFS stores Docker images in layers. Containers share common layers instead of creating duplicate copies.

### Real-Time Example

100 containers use the same Ubuntu image.

Without OverlayFS:

* 100 copies of Ubuntu are stored.

With OverlayFS:

* One Ubuntu layer is shared by all containers.

This saves storage and speeds up image creation.

**Remember:** **OverlayFS = Shared Image Layers**

---

# Summary

| Feature    | Purpose             | Easy to Remember                  |
| ---------- | ------------------- | --------------------------------- |
| Namespaces | Isolates containers | Separate Rooms                    |
| Cgroups    | Limits CPU & Memory | Pizza Shared Equally              |
| OverlayFS  | Shares image layers | One Foundation for Many Buildings |

---

# Interview Tip

**How are Docker containers created?**

Docker uses Linux kernel features:

* **Namespaces** → Isolate containers.
* **Cgroups** → Limit and monitor resources.
* **OverlayFS** → Store images efficiently using layers.

These three technologies work together to create lightweight and efficient Docker containers.
