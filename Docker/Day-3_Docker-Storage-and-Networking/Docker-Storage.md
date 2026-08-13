# 🐳 Day 3 — Part 1: Docker Storage

## 1. Container Writable Layer

**Definition:**
A temporary writable layer added on top of the read-only Docker image where changes made by a running container are stored.

```text
┌──────────────────────────────┐
│ Container Writable Layer     │ ← Changes happen here
├──────────────────────────────┤
│ Application Layer            │
├──────────────────────────────┤
│ Runtime Layer                │
├──────────────────────────────┤
│ Base Image Layer             │
└──────────────────────────────┘
```

**Real-Time Example:**
An application creates a temporary log file inside the container. The file is stored in the writable layer.

---

## 2. Docker Volume

**Definition:**
A Docker-managed storage mechanism used to persist data independently of a container's lifecycle.

```text
Container
    │
    └────── Volume
              │
              ↓
        Persistent Data
```

**Real-Time Example:**
A MySQL container stores customer and order data in a Docker volume.

If the container is deleted:

```text
MySQL Container ❌
       │
       ↓
Docker Volume ✅
       │
       ↓
Database Data ✅
```

---

## 3. Named Volume

**Definition:**
A Docker volume with a user-defined name, making persistent storage easy to identify and manage.

```text
MySQL Container
       │
       ↓
   mysql-data
       │
       ↓
Database Data
```

**Real-Time Example:**
A MySQL container uses `mysql-data`. If the container is replaced, the same volume can be attached to the new container.

---

## 4. Anonymous Volume

**Definition:**
A Docker volume without a user-defined name; Docker assigns an identifier automatically.

```text
Container
    │
    ↓
Docker Volume
    │
    ↓
Generated Name
```

**Real-Time Example:**
A Docker image may declare a volume for a specific directory without explicitly naming the volume.

---

## 5. Bind Mount

**Definition:**
A storage mechanism that maps a specific file or directory from the host directly into a container.

```text
Host Machine
     │
     │ /home/mahesh/project
     ↓
Container
     │
     │ /app
     ↓
Application
```

**Real-Time Example:**
During C++ development, the host project directory is mounted into `/app`. Changes made to the source code on the host are visible inside the container.

---

## 6. Volume vs Bind Mount

```text
Docker Volume
      │
      ↓
Docker-managed Storage
      │
      ↓
Good for Database Data


Bind Mount
      │
      ↓
Host Directory
      │
      ↓
Good for Development Code
```

| Volume                               | Bind Mount                |
| ------------------------------------ | ------------------------- |
| Managed by Docker                    | Managed using a host path |
| Good for persistent application data | Good for development      |
| Common for databases                 | Common for source code    |

**Easy Rule:**

```text
Database Data      → Docker Volume
Development Code   → Bind Mount
```

---

## 7. Persistent Storage

**Definition:**
Storage that remains available independently of the container's lifecycle.

```text
Old Container ❌
       │
       ↓
    Volume ✅
       │
       ↓
New Container ✅
       │
       ↓
Same Data ✅
```

**Real-Time Example:**
A MySQL container is deleted and recreated, but customer data remains because it is stored in a volume.

---

# 🎤 Interview Questions

### Why use a Docker Volume for a database?

> Containers are replaceable, but database data needs to persist. A volume stores the data outside the container's writable layer.

### What happens to data in the writable layer when a container is deleted?

> Data stored only in the writable layer is lost with the container.

### What happens to a volume when its container is deleted?

> The volume normally remains unless it is explicitly removed.

### Volume vs Bind Mount?

> A volume is managed by Docker, while a bind mount maps a specific host path into the container.

### Why is a Volume commonly used for databases?

> Because database data needs to survive container replacement, while Docker volumes are independent of the container lifecycle.

---

# 🧠 Quick Revision

```text
Writable Layer → Temporary container data

Volume         → Docker-managed persistent data

Named Volume   → User-named persistent volume

Anonymous      → Docker-named volume

Bind Mount     → Host path ↔ Container path
```

## 🎯 Key Takeaway

```text
                 Docker Container
                       │
          ┌────────────┴────────────┐
          │                         │
   Writable Layer              Persistent Storage
          │                         │
   Temporary Data          ┌────────┴────────┐
                           │                 │
                        Volume          Bind Mount
                           │                 │
                     Docker-managed      Host-managed
```

> **Containers are temporary; important data should be stored using persistent storage such as Docker Volumes.**
