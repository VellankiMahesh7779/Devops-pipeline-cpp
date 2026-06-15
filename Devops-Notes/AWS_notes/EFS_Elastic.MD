# AWS EFS (Elastic File System)

## What is EFS?

Amazon EFS (Elastic File System) is a fully managed shared file storage service provided by AWS.

It allows multiple EC2 instances to access the same files and directories simultaneously, even when the instances are located in different Availability Zones within the same AWS Region.

### Example

```text
EC2 Instance 1 (ap-south-1a)
            \
             \
              EFS
             /
            /
EC2 Instance 2 (ap-south-1b)
```

If a file is created on EC2 Instance 1, it can be accessed immediately from EC2 Instance 2.

---

# What is NFS?

NFS (Network File System) is a protocol that allows multiple servers to share files over a network.

Amazon EFS uses the NFS protocol internally.

### Difference Between EFS and NFS

| EFS                   | NFS                            |
| --------------------- | ------------------------------ |
| AWS Managed Service   | Self-managed File Sharing      |
| Highly Available      | Depends on NFS Server          |
| Auto Scaling Storage  | Manual Storage Management      |
| Multi-AZ Support      | Usually Single Server          |
| No Server Maintenance | Requires Server Administration |

---

# EFS Creation Steps

## Prerequisites

* Create two EC2 instances.
* Instances can be in different Availability Zones.
* Ensure both instances are in the same VPC.

Example:

```text
EC2-1 → ap-south-1a
EC2-2 → ap-south-1b
```

---

## Step 1: Create EFS

1. Open AWS Console.
2. Navigate to EFS.
3. Click **Create File System**.
4. Enter the file system name.
5. Click **Customize**.

### Storage Options

* Select **One Zone** if only one Availability Zone is required.
* Select **Regional** if the file system needs to be accessed from multiple Availability Zones.

Click **Next**.

---

## Step 2: Configure Mount Targets

1. Select the Availability Zones where the EC2 instances are running.
2. Select the required subnets.
3. Attach the appropriate Security Group.

### Security Group Rule

Allow NFS traffic:

```text
Type      : NFS
Protocol  : TCP
Port      : 2049
Source    : EC2 Security Group
```

Click **Next**.

---

## Step 3: Review and Create

1. Review all configurations.
2. Click **Create File System**.

Wait until the EFS status becomes **Available**.

---

# Mount EFS on EC2 Instances

## Install EFS Utilities

Amazon Linux:

```bash
sudo yum install -y amazon-efs-utils
```

---

## Create Mount Directory

Run on both EC2 instances:

```bash
sudo mkdir /efs
```

---

## Mount EFS

Copy the DNS mount command from the EFS console.

Example:

```bash
sudo mount -t efs -o tls fs-06cbf48264d1e2d99:/ /efs
```

Run the command on both EC2 instances.

---

## Verify Mount

```bash
df -h
```

Expected output:

```text
fs-06cbf48264d1e2d99:/   /efs
```

---

# Testing EFS

## On EC2 Instance 1

```bash
echo "Hello from Server 1" > /efs/test.txt
```

## On EC2 Instance 2

```bash
cat /efs/test.txt
```

Output:

```text
Hello from Server 1
```

This confirms that both servers are accessing the same shared storage.

---

# Real-Time Use Cases

* Shared application logs
* Shared website content
* Jenkins shared workspace
* Kubernetes persistent storage
* Multi-server application deployments

---

# Interview Question

### What is Amazon EFS?

Amazon EFS (Elastic File System) is a fully managed, scalable file storage service that uses the NFS protocol and allows multiple EC2 instances across different Availability Zones to access the same shared file system simultaneously.
