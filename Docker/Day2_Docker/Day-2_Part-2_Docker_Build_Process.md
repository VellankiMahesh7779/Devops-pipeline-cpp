# 🐳 Day 2 — Docker Build Process

## Topics Covered

* Docker Build Process
* Build Context
* `.dockerignore`
* Docker Build Cache

---

## 1. Docker Build Process

Docker reads the Dockerfile and processes its instructions to create an image.

```text
Dockerfile
    ↓
Build Context
    ↓
Docker Build
    ↓
Image Layers
    ↓
Docker Image
```

**Real-Time Example:**

```text
GitHub
   ↓
Jenkins
   ↓
Docker Build
   ↓
payment-api:v1
   ↓
Docker Registry
```

---

## 2. Build Context

Build context is the collection of files Docker can access during the build.

Example:

```text
myapp/
├── Dockerfile
├── app.py
└── requirements.txt
```

If `myapp/` is the build context, Docker can access these files during the build.

**Real-Time Example:**
Jenkins checks out a Git repository. The Jenkins workspace becomes the Docker build context.

---

## 3. `.dockerignore`

`.dockerignore` excludes unnecessary files from the build context.

Example:

```text
.git
logs/
temp/
*.log
```

**Real-Time Example:**
A project may contain 500 MB of logs and temporary files, while the application needs only 50 MB. `.dockerignore` prevents unnecessary files from being sent to the builder.

### Benefits

* Faster builds
* Smaller build context
* Avoids unnecessary files
* Helps prevent accidental inclusion of unwanted files

---

## 4. Docker Build Cache

Docker can reuse previously built layers when the corresponding build steps haven't changed.

Example:

```dockerfile
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
```

If only `app.py` changes:

```text
requirements.txt → ♻️ Reused
pip install      → ♻️ Reused
app.py            → 🔄 Rebuilt
```

**Real-Time Example:**
Jenkins builds an application 20 times a day. Docker cache avoids reinstalling unchanged dependencies on every build.

---

## Interview Point

> Docker build cache improves build performance by reusing unchanged layers instead of rebuilding them.
