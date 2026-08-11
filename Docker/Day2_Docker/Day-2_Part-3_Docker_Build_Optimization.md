# 🐳 Day 2 — Docker Build Optimization

## Topics Covered

* Layer Optimization
* Image Size Optimization
* Cache-Friendly Dockerfiles
* Multi-Stage Build

---

## 1. Layer Optimization

Avoid unnecessary filesystem changes and combine related commands when appropriate.

Instead of creating unnecessary layers:

```dockerfile
RUN apt update
RUN apt install -y g++
```

You can commonly use:

```dockerfile
RUN apt update && apt install -y g++
```

---

## 2. Image Size Optimization

Smaller images are generally better because they:

* Download faster
* Start faster
* Use less storage
* Reduce attack surface

### Real-Time Example

Instead of using a large general-purpose image containing many unnecessary tools, use a smaller suitable base image.

---

## 3. Cache-Friendly Dockerfile

Put files that change less frequently before files that change frequently.

Example:

```dockerfile
COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .
```

If only application code changes, the dependency layer can usually be reused.

---

## 4. Multi-Stage Build

Multi-stage builds allow you to use one stage for **building** and another smaller stage for **running** the application.

```text
Build Stage
C++ Compiler
Libraries
Source Code
       ↓
   Build Binary
       ↓
Runtime Stage
Only Required Binary
```

**Real-Time Example:**

A C++ application may need `g++` and development libraries to compile, but the final application may need only the compiled binary and runtime libraries.

This can significantly reduce the final image size.

---

## 🎯 Main Goal

```text
Good Dockerfile
      ↓
Small Image
      +
Fast Build
      +
Good Cache Usage
      +
Less Unnecessary Data
```

### Interview Point

> Docker image optimization focuses on reducing image size, improving build/cache efficiency, minimizing unnecessary dependencies, and producing secure, production-ready images.
