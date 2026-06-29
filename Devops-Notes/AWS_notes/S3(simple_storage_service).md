# Amazon S3 (Simple Storage Service) - DevOps Notes

## What is Amazon S3?
Amazon S3 (Simple Storage Service) is an **object storage service** in AWS used to store and retrieve any amount of data from anywhere.

### Common Use Cases
- Application backups
- Jenkins artifacts
- Terraform state files
- Log storage
- Static website hosting
- Database backups

---

# What is an S3 Bucket?

An **S3 Bucket** is a container used to store files (called objects) in S3.

Example:

```text
Bucket: company-backups

Objects:
├── db-backup.sql
├── app.log
├── image.png
```

Think of it as:

```text
Folder on your laptop = S3 Bucket
Files inside folder = Objects
```

---

# Why Do We Need an S3 Bucket?

Without a bucket, AWS has no place to store your files.

We use buckets to:

- Organize data
- Store backups
- Store logs
- Store build artifacts
- Host websites
- Store Terraform state files

---

# Benefits of S3

### Unlimited Storage
No need to increase disk size manually.

### Highly Durable
```text
99.999999999% (11 Nines) Durability
```

### Highly Available
```text
99.99% Availability
```

### Scalable
Can store millions of objects.

### Cost Effective
Pay only for what you use.

### Secure
Supports:
- IAM Policies
- Bucket Policies
- Encryption

---

# S3 Components

## Bucket
Container that stores objects.

Example:
```text
my-backup-bucket
terraform-state-bucket
```

## Object
A file stored inside the bucket.

Example:
```text
image.png
backup.zip
app.log
```

## Object Key
The complete path of the object.

Example:
```text
logs/app.log
backups/db.sql
```

---

# S3 Storage Classes

| Storage Class | Use Case |
|--------------|-----------|
| Standard | Frequently used data |
| Standard-IA | Monthly backups |
| Glacier | Archive storage |
| Glacier Deep Archive | Long-term backups |

---

# Important Features for DevOps

## Versioning
Maintains multiple versions of an object.

Benefits:
- Recover deleted files
- Protect from accidental overwrites

---

## Lifecycle Policies
Automatically move files to cheaper storage.

Example:

```text
30 Days  → Standard-IA
90 Days  → Glacier
365 Days → Delete
```

---

## Encryption

### SSE-S3
AWS manages encryption keys.

### SSE-KMS
AWS KMS manages encryption keys.

---

## Bucket Policy
Controls access to the bucket.

---

## Pre-Signed URL
Provides temporary access to private files.

---

## Replication
Copies data to another bucket or AWS Region for disaster recovery.

# How to Create an S3 Bucket (AWS Console)

### Step 1
Login to AWS Console.

### Step 2
Search for:

```text
S3
```

### Step 3
Click:

```text
Create Bucket
```

### Step 4
Enter:

```text
Bucket Name:
my-devops-bucket
```

### Step 5
Select Region.

Example:

```text
Asia Pacific (Mumbai) ap-south-1
```

### Step 6
Keep:

```text
Block Public Access = Enabled
```

### Step 7
Click:

```text
Create Bucket
```

---

# Upload a File

1. Open the bucket.
2. Click Upload.
3. Add files.
4. Click Upload.

---
---

# Eamples
## Terraform Remote State

```text
Terraform
     ↓
terraform.tfstate
     ↓
S3 Bucket
```
---
## Jenkins Artifacts

```text
Jenkins Build
      ↓
artifact.jar
      ↓
S3 Bucket
```

---

## Database Backups

```text
Database
    ↓
backup.sql
    ↓
S3 Bucket
```

---

## Application Logs

```text
Application
      ↓
Logs
      ↓
S3 Bucket
```

---

## Kubernetes Backups

```text
etcd Backup
     ↓
S3 Bucket
```

---

# S3 Security Best Practices

✅ Enable Versioning

✅ Enable Encryption

✅ Block Public Access

✅ Use IAM Roles

✅ Enable Lifecycle Policies

---
