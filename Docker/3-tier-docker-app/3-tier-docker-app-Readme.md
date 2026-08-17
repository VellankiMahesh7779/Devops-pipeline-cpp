# 🐳 Docker 3-Tier Application

A real multi-container application using **Frontend + Backend + MySQL**.

The database is initialized automatically using `database/init.sql`, so product data does not need to be entered manually.

## 🏗️ Architecture

```text
                    🌐 User
                       │
                    :8080
                       ↓
              ┌─────────────────┐
              │    Frontend     │
              │   HTML + Nginx  │
              │      :80        │
              └────────┬────────┘
                       │
                  my-bridge
                       │
              ┌────────▼────────┐
              │     Backend     │
              │  Python + Flask │
              │      :5000      │
              └────────┬────────┘
                       │
                  my-bridge
                       │
              ┌────────▼────────┐
              │     MySQL       │
              │      :3306      │
              └────────┬────────┘
                       │
                       ↓
                  mysql-data
```

## 📁 Project Structure

```text
3-tier-docker-app/
│
├── frontend/
│   ├── Dockerfile
│   ├── index.html
│   └── nginx.conf
│
├── backend/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
│
└── database/
    └── init.sql
```

## 1. Docker Network

A custom bridge network allows containers to communicate using container names.

```bash
docker network create my-bridge
```

Creates the application network.

```bash
docker network ls
```

Lists Docker networks.

```bash
docker network inspect my-bridge
```

Shows connected containers and network details.

## 2. Docker Volume

A volume stores MySQL data outside the container.

```bash
docker volume create mysql-data
```

Creates persistent storage.

```bash
docker volume ls
```

Lists Docker volumes.

```text
MySQL Container
      ↓
  mysql-data
      ↓
Persistent Database Data
```

## 3. Database Initialization

Instead of manually creating tables and inserting products, use:

```text
database/init.sql
```

Example:

```sql
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL
);

INSERT INTO products (name, price)
VALUES
('Laptop', 50000),
('Phone', 25000),
('Headphones', 3000);
```

MySQL executes this file automatically when the database is initialized for the first time.

## 4. MySQL Container

```bash
docker run -d   --name mysql-app   --network my-bridge   -e MYSQL_ROOT_PASSWORD=root123   -e MYSQL_DATABASE=appdb   -v mysql-data:/var/lib/mysql   -v ~/3-tier-docker-app/database/init.sql:/docker-entrypoint-initdb.d/init.sql   mysql:8.0
```

### Important Options

```text
-d             → Run in background
--name         → Container name
--network      → Connect to my-bridge
-e             → Set environment variables
-v mysql-data  → Persistent database storage
-v init.sql    → Automatically initialize database
mysql:8.0      → MySQL image
```

Check:

```bash
docker ps
```

Check logs:

```bash
docker logs mysql-app
```

## 5. Backend

The backend uses **Python + Flask**.

```text
Python Image
     ↓
Install Dependencies
     ↓
Copy Application
     ↓
Start Flask
     ↓
Port 5000
```

Build:

```bash
cd ~/3-tier-docker-app/backend
docker build -t three-tier-backend:2.0 .
```

Run:

```bash
docker run -d   --name backend-app   --network my-bridge   -e DB_HOST=mysql-app   -e DB_USER=root   -e DB_PASSWORD=root123   -e DB_NAME=appdb   three-tier-backend:2.0
```

The backend uses `mysql-app` as the database hostname because Docker DNS resolves the container name.

## 6. Backend → MySQL

```text
Backend
   ↓
mysql-app:3306
   ↓
Docker DNS
   ↓
MySQL
   ↓
appdb
   ↓
products
```

Test:

```bash
docker exec backend-app python -c "import mysql.connector; c=mysql.connector.connect(host='mysql-app',user='root',password='root123',database='appdb'); print(c.is_connected()); c.close()"
```

Expected:

```text
True
```

## 7. Frontend

The frontend uses **HTML + JavaScript + Nginx**.

```text
🌐 Browser
    ↓
Frontend Nginx
    ↓
/api/products
    ↓
Backend Flask
    ↓
MySQL
```

Build:

```bash
cd ~/3-tier-docker-app/frontend
docker build -t three-tier-frontend:2.0 .
```

Run:

```bash
docker run -d   --name frontend-app   --network my-bridge   -p 8081:80   three-tier-frontend:2.0
```

### Port Mapping

```text
Host :8080
    ↓
Frontend Container :80
```

Access:

```text
http://<VM-IP>:8081
```

## 🔄 Complete Application Flow

```text
🌐 User
   ↓
Host :8080
   ↓
Frontend :80
   ↓
Backend :5000
   ↓
MySQL :3306
   ↓
appdb
   ↓
products
   ↓
JSON Response
   ↓
Frontend
   ↓
🌐 User
```

## 🚀 Complete Setup Order

```text
1. Create Network
        ↓
2. Create Volume
        ↓
3. Create MySQL + init.sql
        ↓
4. Build Backend Image
        ↓
5. Run Backend Container
        ↓
6. Build Frontend Image
        ↓
7. Run Frontend Container
        ↓
8. Open Application
```

## 🔍 Troubleshooting

```bash
docker ps -a
```

Check all containers.

```bash
docker logs frontend-app
docker logs backend-app
docker logs mysql-app
```

Check container logs.

```bash
docker network inspect my-bridge
```

Check network and connected containers.

```bash
docker run --rm --network my-bridge busybox ping -c 3 mysql-app
```

Test Docker DNS and network connectivity.

```bash
docker run --rm --network my-bridge busybox nc -zvw 3 mysql-app 3306
```

Test whether MySQL port `3306` is reachable.

## 🏢 Real-Time Example

```text
Frontend → Displays products
Backend  → Handles APIs and business logic
MySQL    → Stores products, users and orders
init.sql → Automatically creates database structure/data
Volume   → Keeps database data persistent
Network  → Connects containers
```

## 🎤 Interview Definition

> A 3-tier Docker application separates the frontend, backend, and database into independent containers. Docker networking enables communication between containers, while volumes provide persistent storage. Database initialization scripts can automatically create the required schema and initial data.

## 🧠 Learning Outcome

✔ Built a real 3-tier Docker application.  
✔ Created a custom Docker bridge network.  
✔ Used Docker DNS for container communication.  
✔ Used Docker volumes for persistent MySQL data.  
✔ Connected Flask backend with MySQL.  
✔ Used `init.sql` for automatic database initialization.  
✔ Used Nginx as the frontend and reverse proxy.  
✔ Practiced image building, container creation, networking, volumes, and troubleshooting.
