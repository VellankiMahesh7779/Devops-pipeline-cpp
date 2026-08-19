# Docker Compose

## What is Docker Compose?

Docker Compose is used to **create and manage multiple Docker containers together** using one `docker-compose.yml` file.

### Why do we need Docker Compose?

Suppose our application has:

```text
Frontend
   ↓
Backend
   ↓
MySQL
```

Without Compose, we need to run multiple `docker run` commands.

With Docker Compose:

```bash
docker compose up -d
```

One command starts all required containers.

---

## What Docker Compose Provides

Docker Compose helps us manage:

* Multiple containers
* Container networking
* Environment variables
* Volumes
* Container dependencies
* Port mapping

---

## Important Commands

### Check Version

```bash
docker compose version
```

### Start Containers

```bash
docker compose up
```

### Start in Background

```bash
docker compose up -d
```

### Build and Start

```bash
docker compose up -d --build
```
### If you changed the Dockerfile or anyotherfile(index.html, main.cpp etc)

## Run the same command:
```bash
docker compose up -d --build < path of file >
example:
docker compose up -d --build fronend
```
## If you suspect Docker cache is causing an issue:

```bash
docker compose up -d --build --no-cache frontend
```
### Check Containers

```bash
docker compose ps
```

### View Logs

```bash
docker compose logs
```

### Follow Logs

```bash
docker compose logs -f
```

### Stop Containers

```bash
docker compose stop
```

### Start Stopped Containers

```bash
docker compose start
```

### Restart Containers

```bash
docker compose restart
```

### Stop and Remove Containers

```bash
docker compose down
```

### Stop, Remove Containers and Volumes

```bash
docker compose down -v
```

> ⚠️ `docker compose down -v` removes the volumes, so persistent database data can be deleted.

---

## Simple Workflow

```text
docker-compose.yml
       ↓
docker compose up -d
       ↓
Containers Created
       ↓
Frontend + Backend + Database
       ↓
docker compose ps
       ↓
Check Status
```

### Key Point

**Docker → Manage individual containers**

**Docker Compose → Manage multiple related containers together**
