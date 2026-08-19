# Note: Docker-compose.yml file is present 3-tier-docker-application Folder.

# Docker Compose YAML File

## Complete File

```yaml
version: "3.8"

services:

  frontend:
    build: ./frontend
    ports:
      - "8081:80"

  backend:
    build: ./backend

    environment:
      DB_HOST: mysql
      DB_USER: root
      DB_PASSWORD: root123
      DB_NAME: appdb

    restart: unless-stopped

    depends_on:
      - mysql

  mysql:
    image: mysql:8.0

    environment:
      MYSQL_ROOT_PASSWORD: root123
      MYSQL_DATABASE: appdb

    volumes:
      - mysql-data:/var/lib/mysql
      - ./database/init.sql:/docker-entrypoint-initdb.d/init.sql

    healthcheck:
      test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  mysql-data:
```

---

# 1. `version`

```yaml
version: "3.8"
```

Specifies the Docker Compose file format version.

---

# 2. `services`

```yaml
services:
```

This is where we define **all the containers** that our application needs.

In our application:

```text
services
   |
   +-- frontend
   |
   +-- backend
   |
   +-- mysql
```

So we are creating **3 services/containers**.

---

# 3. Frontend Service

```yaml
frontend:
  build: ./frontend
  ports:
    - "8081:80"
```

### `frontend:`

Name of the service.

### `build: ./frontend`

Go to the `frontend` folder and find the Dockerfile.

```text
project
   |
   +-- frontend
       |
       +-- Dockerfile
```

Docker Compose uses this Dockerfile to build the frontend image.

### `ports`

```yaml
- "8081:80"
```

Port mapping:

```text
Your Computer          Frontend Container
     8081       →            80
```

So we access the frontend using:

```text
http://localhost:8081
```

---

# 4. Backend Service

```yaml
backend:
  build: ./backend
```

Creates the backend image using the Dockerfile inside:

```text
backend/
└── Dockerfile
```

---

# 5. Backend Environment Variables

```yaml
environment:
  DB_HOST: mysql
  DB_USER: root
  DB_PASSWORD: root123
  DB_NAME: appdb
```

These values tell the backend **how to connect to MySQL**.

Think of it like:

```text
Backend
   |
   |-- DB_HOST     → mysql
   |-- DB_USER     → root
   |-- DB_PASSWORD → root123
   |-- DB_NAME     → appdb
   |
   ↓
 MySQL
```

### Why `DB_HOST: mysql`?

Because `mysql` is the **service name** defined below.

Docker Compose creates a network for the services, so the backend can find MySQL using:

```text
mysql
```

We don't need to manually find the MySQL container IP.

---

# 6. `restart`

```yaml
restart: unless-stopped
```

If the backend container crashes, Docker tries to restart it automatically.

```text
Backend crashes
      ↓
Docker restarts it
```

If we manually stop it, Docker will not restart it.

---

# 7. `depends_on`

```yaml
depends_on:
  - mysql
```

This means:

**Backend depends on MySQL.**

Docker Compose starts MySQL before starting the backend.

```text
MySQL
  ↓
Backend
```

---

# 8. MySQL Service

```yaml
mysql:
  image: mysql:8.0
```

Here we don't build our own image.

We directly use:

```text
MySQL 8.0 Docker Image
```

Docker will download it if it doesn't already exist.

---

# 9. MySQL Environment Variables

```yaml
environment:
  MYSQL_ROOT_PASSWORD: root123
  MYSQL_DATABASE: appdb
```

These configure MySQL when it starts.

```text
Root Password → root123
Database      → appdb
```

So MySQL creates the `appdb` database.

---

# 10. MySQL Volume

```yaml
volumes:
  - mysql-data:/var/lib/mysql
```

This is used to **save MySQL data**.

The important idea is:

```text
MySQL Container
      |
      ↓
mysql-data Volume
      |
      ↓
Database Data
```

If the container is removed, the data can still remain in the volume.

---

# 11. `init.sql`

```yaml
- ./database/init.sql:/docker-entrypoint-initdb.d/init.sql
```

This connects our local SQL file to the MySQL container.

Project:

```text
database/
└── init.sql
```

Inside container:

```text
/docker-entrypoint-initdb.d/init.sql
```

MySQL can use this SQL file when initializing the database.

For example, `init.sql` could contain:

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);
```

---

# 12. Healthcheck

```yaml
healthcheck:
  test: ["CMD", "mysqladmin", "ping", "-h", "localhost"]
```

This checks whether MySQL is actually responding.

Simply:

```text
Is MySQL working?
       ↓
      YES
       ↓
   Healthy
```

---

## Healthcheck Timing

```yaml
interval: 10s
timeout: 5s
retries: 5
```

### `interval`

```text
Check every 10 seconds
```

### `timeout`

```text
Wait maximum 5 seconds for a response
```

### `retries`

```text
Try up to 5 times
```

---

# 13. Named Volume

At the bottom:

```yaml
volumes:
  mysql-data:
```

This tells Docker to create a named volume called:

```text
mysql-data
```

It is used by:

```yaml
- mysql-data:/var/lib/mysql
```

---

# Complete Application Flow

```text
                    Docker Compose
                         |
             +-----------+-----------+
             |           |           |
             ↓           ↓           ↓
         Frontend     Backend      MySQL
          :8081         |            |
             |          |            |
             |          +----------→ |
             |                       |
             |                  mysql-data
             |                    Volume
             |
          Browser
             |
             ↓
     http://localhost:8081
```

# Easy Way to Remember

| YAML          | Simple Meaning                      |
| ------------- | ----------------------------------- |
| `services`    | Containers we need                  |
| `build`       | Build image using Dockerfile        |
| `image`       | Use an existing image               |
| `ports`       | Connect host port to container port |
| `environment` | Configuration values                |
| `depends_on`  | Start dependency first              |
| `restart`     | Restart container if it crashes     |
| `volumes`     | Store data permanently              |
| `healthcheck` | Check whether container is healthy  |

## Main Idea

We don't need to memorize the entire YAML.

Just understand:

```text
services
   ↓
What containers do I need?

build / image
   ↓
How do I create the container?

ports
   ↓
How do I access it?

environment
   ↓
What configuration does it need?

depends_on
   ↓
Does it depend on another container?

volumes
   ↓
What data should be saved?

healthcheck
   ↓
Is the service working?
```
