# AWS VPC (Virtual Private Cloud)

## What is a VPC?

A **Virtual Private Cloud (VPC)** is a private network inside AWS where you can securely launch and manage AWS resources like **EC2, RDS, EFS, and Load Balancers**.

Each VPC is isolated from other AWS customers, giving you full control over networking.

---

## Why Do We Need a VPC?

- Securely host AWS resources.
- Control network traffic.
- Define your own IP address range.
- Create public and private networks.
- Improve security using routing and network access rules.

---

## CIDR Block

When creating a VPC, you must specify a **CIDR (Classless Inter-Domain Routing)** block, which defines the IP address range of the VPC.

### Private IPv4 CIDR Ranges (RFC 1918)

| CIDR Range | Example |
|------------|---------|
| 10.0.0.0/8 | 10.0.0.0/16 |
| 172.16.0.0/12 | 172.31.0.0/16 |
| 192.168.0.0/16 | 192.168.0.0/24 |

Example:
```
VPC CIDR: 10.0.0.0/16
```

---

# Components of a VPC

## 1. VPC
A virtual private network in AWS that contains all your AWS resources.

---

## 2. Subnet
A subnet is a smaller network inside a VPC.

There are two types:

- **Public Subnet** – Has internet access.
- **Private Subnet** – No direct internet access.

**Note:** A subnet belongs to only one Availability Zone (AZ).

---

## 3. IP Addressing

AWS supports:

- IPv4
- IPv6

Each resource (EC2, Load Balancer, NAT Gateway, etc.) receives an IP address from the subnet.

---

## 4. Route Table

A Route Table controls where network traffic goes.

Example:

| Destination | Target |
|-------------|---------|
| 10.0.0.0/16 | Local |
| 0.0.0.0/0 | Internet Gateway |

---

## 5. Internet Gateway (IGW)

An Internet Gateway allows resources in a **public subnet** to communicate with the internet.

Without an IGW:
- No internet access
- Cannot SSH from your laptop
- Cannot access websites

---

## 6. NAT Gateway

A NAT Gateway allows instances in a **private subnet** to access the internet without allowing inbound internet connections.

Used for:
- Software updates
- Installing packages
- Downloading dependencies

---

## 7. VPC Endpoint

A VPC Endpoint allows your VPC to access AWS services (like S3 or DynamoDB) **privately**, without using the internet.

Benefits:
- More secure
- Lower latency
- No Internet Gateway required

---

# Basic VPC Architecture

```
                    Internet
                        |
                Internet Gateway
                        |
               -------------------
               |                 |
        Public Subnet      Public Subnet
           Web Server        Load Balancer
               |
          NAT Gateway
               |
        -----------------
        |               |
  Private Subnet   Private Subnet
   App Server        Database
```

---

# Key Points

- VPC is your private network in AWS.
- Every VPC has a CIDR block.
- Subnets divide the VPC into smaller networks.
- Route Tables control traffic.
- Internet Gateway provides internet access.
- NAT Gateway gives private instances outbound internet access.
- VPC Endpoints securely connect to AWS services.

---
