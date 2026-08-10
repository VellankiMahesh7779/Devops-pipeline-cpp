# 🐳 Dockerfile

## What is a Dockerfile?

A **Dockerfile** is a text file containing instructions that tell Docker how to build a Docker Image.

```text
Dockerfile
    ↓
docker build
    ↓
Docker Image
    ↓
docker run
    ↓
Container
```

---

# 🚆 Dockerfile Instructions — Easy Reference

Think of a Dockerfile like **preparing a train** for a journey.

```text
🚆 Dockerfile — C++ Application

FROM        → 🚂 Engine                         = ubuntu:24.04
ARG         → 📝 Build Instructions             = ARG APP_VERSION=1.0
WORKDIR     → 🪑 Working Coach                  = /app/src
COPY        → 📦 Load Application               = COPY server.cpp .
ADD         → 📦 Special Cargo                  = ADD app.tar.gz /app/
RUN         → 🔧 Prepare Train                  = RUN apt-get install -y g++
ENV         → 🏷️ Environment Information        = ENV APP_NAME=cpp-server
USER        → 👨‍✈️ Driver                         = USER appuser
EXPOSE      → 🚉 Application Port               = EXPOSE 9090
VOLUME      → 🧳 Persistent Storage             = VOLUME /app/data
ENTRYPOINT  → 🚆 Main Journey                   = ENTRYPOINT ["./server"]
CMD         → 🎛️ Default Options                = CMD ["--port","9090"]

```
## 1. FROM → 🚂 Engine

Defines the base image.

```dockerfile
FROM ubuntu:24.04
```

**Real-time:** Start a C++ application with an Ubuntu environment.

---

## 2. WORKDIR → 🪑 Working Coach

Sets the working directory inside the image.

```dockerfile
WORKDIR /app/src
```

**Real-time:** Keep the application files organized inside `/app/src`.

---

## 3. COPY → 📦 Load Application

Copies files from the build context into the image.

```dockerfile
COPY server.cpp .
```

**Real-time:** Copy the C++ source code into the container.

---

## 4. ADD → 📦 Special Cargo

Copies files and provides additional features such as extracting local tar archives.

```dockerfile
ADD app.tar.gz /app/
```

**Real-time:** Add and extract an application archive.

**Best Practice:** Use `COPY` for normal file copying.

---

## 5. RUN → 🔧 Prepare Train

Executes commands while building the image.

```dockerfile
RUN apt-get update && apt-get install -y g++
```

**Real-time:** Install the C++ compiler while creating the image.

---

## 6. ARG → 📝 Build Instructions

Defines a variable available during image build.

```dockerfile
ARG APP_VERSION=1.0
```

**Real-time:** Jenkins can provide a different application version during the build.

**Remember:** `ARG` → Build time.

---

## 7. ENV → 🏷️ Environment Information

Defines environment variables available in the image/container.

```dockerfile
ENV APP_NAME=cpp-server
```

**Real-time:** The application can read `APP_NAME` when running.

**Remember:** `ENV` → Runtime.

---

## 8. USER → 👨‍✈️ Driver

Specifies the user that runs the application.

```dockerfile
USER appuser
```

**Real-time:** Run the application as a non-root user for better security.

---

## 9. EXPOSE → 🚉 Application Port

Documents the port used by the application.

```dockerfile
EXPOSE 9090
```

**Real-time:** Your C++ HTTP server listens on port `9090`.

> `EXPOSE` does not publish the port to the host.

---

## 10. VOLUME → 🧳 Persistent Storage

Declares a location for persistent data.

```dockerfile
VOLUME ["/app/data"]
```

**Real-time:** Store application data or logs that should survive container replacement.

---

## 11. ENTRYPOINT → 🚆 Main Journey

Defines the main application executed when the container starts.

```dockerfile
ENTRYPOINT ["./server"]
```

**Real-time:** Start the C++ server whenever the container starts.

---

## 12. CMD → 🎛️ Default Options

Provides default command or arguments.

```dockerfile
CMD ["--port", "9090"]
```

Used with:

```dockerfile
ENTRYPOINT ["./server"]
```

Result:

```text
./server --port 9090
```

**Remember:**

```text
ENTRYPOINT → Main application
CMD        → Default arguments
```

---

# 🧠 Easy Dockerfile Thinking Process

When writing a Dockerfile, ask:

```text
What environment do I need?
        ↓
FROM

Where should I work?
        ↓
WORKDIR

What files do I need?
        ↓
COPY / ADD

What must I install or build?
        ↓
RUN

What build-time values do I need?
        ↓
ARG

What runtime values do I need?
        ↓
ENV

Who should run the application?
        ↓
USER

Which port does it use?
        ↓
EXPOSE

Does it need persistent data?
        ↓
VOLUME

What should start?
        ↓
ENTRYPOINT / CMD
```

---

# 🎯 Key Takeaway

**Don't memorize Dockerfiles.**

Understand what your application needs and choose the appropriate Dockerfile instruction.

```text
FROM → Start
WORKDIR → Organize
COPY → Bring files
RUN → Install/Build
ARG → Build-time value
ENV → Runtime value
USER → Run as user
EXPOSE → Application port
VOLUME → Persistent data
ENTRYPOINT → Main application
CMD → Default options
```
