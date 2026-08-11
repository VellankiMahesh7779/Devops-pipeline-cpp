# 🐳 Day 2 — Docker Images

## Topics Covered

* Docker Image
* Image Layers
* Read-Only Image Layer
* Writable Container Layer
* Base Image
* Official Image
* Custom Image
* Image ID
* Image Tag
* Image Digest

---

## 1. Docker Image

A Docker Image is a **read-only template** containing an application and everything required to run it.

```text
Docker Image
     ↓
Container
```

**Real-Time Example:**
A company creates `payment-api:v1` containing the application, runtime, and dependencies. The same image can be used in development, testing, and production.

---

## 2. Image Layers

Docker Images are built using multiple layers.

```text
Application Layer
Java Layer
Ubuntu Layer
```

Common layers can be reused between images.

**Real-Time Example:**
100 Java applications can share the same Java and base OS layers instead of storing them repeatedly.

---

## 3. Read-Only vs Writable Layer

The image layers are **read-only**.

When a container starts, Docker adds a **writable layer** on top.

```text
Writable Container Layer
------------------------
Application Image Layers
```

**Real-Time Example:**
If an application creates a temporary log file, the change happens in the container's writable layer, not the original image.

---

## 4. Base Image

The base image is the starting point for building your image.

```dockerfile
FROM ubuntu:24.04
```

**Real-Time Example:**
Use `ubuntu:24.04` as the base for a C++ application.

---

## 5. Official vs Custom Images

**Official Image:** Standard image provided through trusted official image sources.

Examples:

```text
ubuntu
python
nginx
node
```

**Custom Image:** Image created for your own application.

```text
python:3.12
     ↓
Your Application
     ↓
my-company/payment-api:v1
```

---

## 6. Image ID, Tag & Digest

### Tag

Human-friendly name/version.

```text
payment-api:v1.0
```

### Image ID

Docker's local identifier for an image.

### Digest

Unique cryptographic identifier for exact image content.

```text
payment-api@sha256:xxxxx
```

### Easy Remember

```text
Tag     → Human-friendly version
Image ID → Docker identifier
Digest  → Exact image identity
```
