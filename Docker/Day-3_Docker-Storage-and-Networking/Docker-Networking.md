# 🌐 Docker Networking

## What is Docker Networking?

Docker networking allows containers to communicate with:

* Other containers
* The host machine
* External networks

```text
Frontend Container
        ↓
   Docker Network
        ↓
Backend Container
        ↓
   Docker Network
        ↓
MySQL Container
```

---

# 1. Bridge Network 🌉

The **bridge network** is the common network type for containers running on the same Docker host.

```text
Docker Host
┌─────────────────────────────┐
│      Bridge Network         │
│                             │
│ Frontend ↔ Backend ↔ MySQL │
└─────────────────────────────┘
```

### Real-Time

A 3-tier application can run:

```text
Frontend → Backend → Database
```

using a Docker bridge network.

---

# 2. Default vs User-Defined Bridge

Docker provides a default `bridge` network.

For applications, a **user-defined bridge** is generally preferred because it provides better isolation and built-in DNS-based name resolution.

```text
app-network
├── frontend
├── backend
└── mysql
```

### Create a network

```bash
docker network create my-network
```

### Run container on it

```bash
docker run -d --name mysql --network my-network mysql
```

---

# 3. Container-to-Container Communication

Containers connected to the same user-defined network can communicate with each other.

```text
Backend
   ↓
my-network
   ↓
MySQL
```

The backend can connect using:

```text
mysql:3306
```

instead of depending on the MySQL container IP.

---

# 4. Docker DNS

Docker provides embedded DNS for containers on user-defined networks.

```text
Backend
   ↓
mysql
   ↓
Docker DNS
   ↓
Current MySQL IP
```

### Why?

Container IP addresses can change when containers are recreated.

```text
❌ backend → 172.18.0.5

✅ backend → mysql
```

### Interview Definition

> Docker DNS allows containers on the same user-defined network to discover each other using names instead of hard-coded IP addresses.

---

# 5. Port Mapping

Port mapping connects a **host port** to a **container port**.

```text
Browser
   ↓
Host:8080
   ↓
Container:9090
   ↓
Application
```

Concept:

```text
8080:9090
  ↑    ↑
Host  Container
```

### Real-Time

Your C++ application listens on `9090`, but users access it through `8080` on the host.

---

# 6. EXPOSE vs Port Publishing

### EXPOSE

```dockerfile
EXPOSE 9090
```

Documents the port the application uses.

It does **not** publish the port to the host by itself.

### Port Publishing

Actually creates host → container access.

```text
Host:8080 → Container:9090
```

### Easy Remember

```text
EXPOSE           → Documentation
Port Publishing  → Actual Host Access
```

---

# 7. Host Network 🖥️

With host networking, the container shares the host's network namespace.

```text
Host Network
      │
      └── Container
```

### Real-Time

Useful for specific applications that need direct access to the host's network stack.

### Important

Network isolation is reduced compared with bridge networking.

---

# 8. None Network 🚫

The `none` network provides no normal external/container networking.

```text
Container
    │
    🚫
Network
```

### Real-Time

Useful when an application needs to run without network access.

---

# 9. Overlay Network 🌐

Overlay networking allows containers on different Docker hosts to communicate over a shared logical network.

```text
Docker Host 1          Docker Host 2
┌───────────┐          ┌───────────┐
│ Frontend  │          │ Backend   │
└─────┬─────┘          └─────┬─────┘
      └──── Overlay Network ──┘
```

### Real-Time

Useful for multi-host container environments such as Docker Swarm.

---

# 10. Macvlan Network 🔌

Macvlan allows containers to appear more like separate physical devices on the network.

```text
Physical Network
       │
   ┌───┼────┐
   ↓   ↓    ↓
 Host  C1   C2
      MAC  MAC
```

### Real-Time

Useful when a container needs its own network identity on an existing physical/L2 network.

> Advanced topic — understand the concept rather than memorizing implementation details.

---

# 11. Host ↔ Container Communication

External users normally reach a container through a published host port.

```text
Browser
   ↓
Host:8080
   ↓
Container:9090
```

For example:

```text
localhost:8080
      ↓
C++ Server:9090
```

---

# 12. Network Troubleshooting 🔍

If one container cannot communicate with another, check:

```text
Application not connecting
        ↓
Is target container running?
        ↓
Same Docker network?
        ↓
Correct hostname?
        ↓
DNS resolving?
        ↓
Correct port?
        ↓
Application listening?
        ↓
Host port publishing correct?
```

### Common Problems

```text
Wrong network
Wrong hostname
Wrong port
Container stopped
Application not listening
Port not published
```

---

# 🏢 Real-Time 3-Tier Architecture

```text
                  🌐 User
                     │
                     ↓
             Frontend Container
                     │
                     ↓
                app-network
                     │
                     ↓
             Backend Container
                     │
                     ↓
                app-network
                     │
                     ↓
              MySQL Container
                     │
                     ↓
                 🗄️ Volume
```

### Communication

```text
User → localhost:8080 → Frontend

Frontend → backend:8080 → Backend

Backend → mysql:3306 → MySQL
```

The database does not need to be publicly exposed just because the backend needs to access it.

---

# 🧠 Network Types — Quick Revision

| Network   | Purpose                                 |
| --------- | --------------------------------------- |
| `bridge`  | Normal container networking             |
| `host`    | Share host network                      |
| `none`    | No normal networking                    |
| `overlay` | Multi-host container networking         |
| `macvlan` | Container appears like a network device |

---

# 🛠️ Important Commands

### List networks

```bash
docker network ls
```

### Inspect a network

```bash
docker network inspect my-network
```

### Create a bridge network

```bash
docker network create my-network
```

### Create explicitly as bridge

```bash
docker network create -d bridge my-network
```

### Run container on a network

```bash
docker run -d --name backend --network my-network myimage
```

### Connect an existing container

```bash
docker network connect my-network backend
```

### Disconnect a container

```bash
docker network disconnect my-network backend
```

### Remove a network

```bash
docker network rm my-network
```

### Run with host network

```bash
docker run --network host myimage
```

### Run without normal networking

```bash
docker run --network none myimage
```

### Publish a port

```bash
docker run -p 8080:9090 myimage
```

```text
-p HOST_PORT:CONTAINER_PORT
```

---

# 🎤 Interview Definitions

### What is Docker Networking?

> Docker networking provides communication between containers, the host, and external networks.

### What is a bridge network?

> A bridge network provides private networking between containers on the same Docker host.

### Why use a user-defined bridge?

> It provides better isolation and allows containers to communicate using names through Docker's embedded DNS.

### Why avoid hard-coded container IPs?

> Container IPs can change when containers are recreated, while service/container names provide stable discovery.

### What is port mapping?

> Port mapping connects a host port to a container port.

### EXPOSE vs Publishing?

> `EXPOSE` documents a container port, while port publishing makes the container port accessible through a host port.

---

# 🎯 Final Revision

```text
🌉 Bridge      → Container networking

🔎 DNS         → Find containers by name

🔀 Port Map    → Host → Container

🖥️ Host        → Share host network

🚫 None        → No normal networking

🌐 Overlay     → Multi-host networking

🔌 Macvlan     → Network-level container identity
```

## ⭐ Most Important for DevOps

Focus strongly on:

```text
Bridge Network
      ↓
User-Defined Network
      ↓
Container Communication
      ↓
Docker DNS
      ↓
Port Mapping
      ↓
EXPOSE vs Publishing
      ↓
Network Troubleshooting
```

> **Key takeaway:** Containers are isolated by default, and Docker networking provides controlled communication between containers, the host, and external systems.
