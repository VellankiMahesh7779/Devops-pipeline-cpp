# AWS Load Balancer, Target Group & Auto Scaling Guide

## 1. Scalability

Scalability means an application or system can handle increasing traffic or workload by adapting its resources.

There are two types of scalability:

### Vertical Scalability (Scale Up)

Increasing the size of an existing server.

Example:

* Upgrade EC2 instance from `t2.micro` to `t2.large`.
* Increase CPU and RAM.

**Advantages**

* Simple to implement.

**Disadvantages**

* There is a limit to how much a server can be upgraded.
* If the server fails, the application goes down.

---

### Horizontal Scalability (Scale Out)

Increasing the number of servers instead of increasing server size.

Example:

* Running 4 EC2 instances instead of one.

**Advantages**

* High availability.
* Better fault tolerance.
* Can handle huge traffic.

**Disadvantages**

* Requires a load balancer.
* Application should support distributed architecture.

---

# 2. What is a Load Balancer?

A Load Balancer distributes incoming traffic among multiple servers.

Instead of users directly accessing individual EC2 instances, they access the Load Balancer.

```
Users
   |
   |
Load Balancer
 /   |   |   \
EC2 EC2 EC2 EC2
```

---

# Why do we need a Load Balancer?

* Distributes traffic across multiple servers.
* Prevents one server from getting overloaded.
* Provides a single DNS name for users.
* Automatically removes unhealthy servers.
* Improves application availability.
* Supports scaling.

---

# Elastic Load Balancer (ELB)

AWS provides a managed Load Balancer service called ELB.

AWS handles:

* Maintenance
* Upgrades
* High Availability
* Fault Tolerance

---

# Types of Load Balancers

## 1. Application Load Balancer (ALB)

* Works at Layer 7.
* Supports HTTP and HTTPS traffic.
* Can route requests based on:

  * URL path
  * Host name
  * Headers

Example:

```
/login      -> Server Group 1
/products   -> Server Group 2
```

---

## 2. Network Load Balancer (NLB)

* Works at Layer 4.
* Handles TCP and UDP traffic.
* Extremely high performance.

---

## 3. Gateway Load Balancer (GWLB)

* Works at Layer 3.
* Mainly used for security appliances like firewalls.

---

# How Load Balancer Works

Suppose we have 4 EC2 instances:

```
EC2-1
EC2-2
EC2-3
EC2-4
```

Users send requests to the Load Balancer.

The Load Balancer forwards requests to these instances one by one.

Example:

```
Request 1 -> EC2-1
Request 2 -> EC2-2
Request 3 -> EC2-3
Request 4 -> EC2-4
Request 5 -> EC2-1
```

This process is called **Load Distribution**.

---

# Step-by-Step Setup

## Step 1: Create EC2 Instances

Create 4 EC2 instances.

You can create a separate Security Group for these instances.

Example Security Group:

Inbound Rules:

* HTTP (80)
* SSH (22)

```
WebServer-SG
```

---

# Step 2: Create Target Group

## What is a Target Group?

A Target Group is a collection of servers (targets).

```
Target Group
      |
--------------------------------
|       |       |       |
EC2-1  EC2-2  EC2-3  EC2-4
```

The Target Group does not distribute traffic.

Its job is:

* Keep all instances together.
* Perform health checks.
* Tell the Load Balancer which instances are healthy.

---

## Why do we need Target Groups?

Suppose:

```
EC2-2 crashes.
```

Health check fails.

Target Group marks:

```
EC2-2 -> Unhealthy
```

Load Balancer will stop sending traffic to that instance.

---

# Health Checks

The Target Group periodically checks:

```
http://server-ip/health
```

or

```
http://server-ip/
```

If the response is successful:

```
Healthy
```

Otherwise:

```
Unhealthy
```

---

# Step 3: Create Application Load Balancer (ALB)

## Configuration

### Name

```
My-ALB
```

### Scheme

```
Internet Facing
```

### IP Type

```
IPv4
```

### Availability Zones

Select all Availability Zones.

Reason:

Your EC2 instances may be in different Availability Zones, and the Load Balancer should be highly available.

---

### Security Group

Create a Security Group for the Load Balancer.

Inbound Rules:

* HTTP (80)
* HTTPS (443)

---

# What is a Listener?

A Listener is like a receptionist.

It waits for requests on a particular port.

Example:

```
Port 80
Port 443
```

---

## Listener Example

```
User Request
      |
      |
Listener (Port 80)
      |
      |
Target Group
      |
EC2 Instances
```

The Listener decides:

"If traffic comes on Port 80, forward it to this Target Group."

---

## Listener Rule

```
IF Request on Port 80
THEN Forward to Web-TG
```

---

# Final Architecture

```
Users
   |
   |
ALB DNS Name
   |
Listener (80)
   |
Target Group
   |
--------------------------------
|       |       |       |
EC2-1  EC2-2  EC2-3  EC2-4
```

---

# Accessing the Application

After creating the Load Balancer, AWS gives a DNS name.

Example:

```
http://my-alb-123456.us-east-1.elb.amazonaws.com
```

Open this DNS in your browser.

The Load Balancer automatically distributes traffic to all instances.

---

# What if 4 Servers Are Not Enough?

Suppose traffic suddenly increases.

The 4 servers cannot handle the load.

This is where **Auto Scaling Group (ASG)** comes into the picture.

---

# What is Auto Scaling Group?

ASG automatically:

* Adds new EC2 instances.
* Removes extra EC2 instances.
* Maintains desired capacity.
* In real life, the load on your websites 
  and application can change.
* In the cloud, you can create and get rid 
  of servers very quickly.
* The goal of an Auto Scaling group (ASG) 
  is to:
   * Scale out (Adding Server) to match an 
     increased load
   * Scale in (remove Server) to match a 
     decreased load 
* If Load is > 90% and stays for 5mins, Add 
1 server 
* If load is < 50% and stays for 5mins, 
Remove 1 server
---

# Auto Scaling Workflow

```
Traffic Increases
        |
        |
Auto Scaling Group
        |
Creates New EC2 Instances
        |
Registers Them in Target Group
        |
Load Balancer Starts Sending Traffic
```

---

# Creating an Auto Scaling Group

## Step 1: Create Launch Template

Launch Template contains:

* AMI
* Instance Type
* Security Group
* Key Pair

It acts as a blueprint for creating new instances.

---

## Step 2: Create Auto Scaling Group

Select:

* Launch Template
* Availability Zones
* Existing Load Balancer
* Existing Target Group

---

## Desired Capacity

The number of instances that should run.

Example:

```
Desired = 2
```

AWS always tries to keep 2 instances running.

---

## Minimum Capacity

Minimum number of instances.

Example:

```
Min = 2
```

Even if traffic is low, 2 instances will run.

---

## Maximum Capacity

Maximum number of instances.

Example:

```
Max = 6
```

ASG can create up to 6 instances when traffic increases.

---

# Complete Architecture

```
Users
   |
   |
Application Load Balancer
   |
Listener (80)
   |
Target Group
   |
Auto Scaling Group
   |
------------------------------------
|      |      |      |      |      |
EC2   EC2    EC2    EC2    EC2    EC2
```

---

# Complete Flow

1. User opens the Load Balancer DNS.
2. Request reaches the Listener.
3. Listener forwards the request to the Target Group.
4. Target Group selects a healthy instance.
5. Load Balancer sends the request to that instance.
6. If traffic increases:

   * Auto Scaling Group launches new instances.
   * New instances automatically join the Target Group.
7. Load Balancer starts distributing traffic to the new instances.

---

# Simple Interview Answer

```
Client
  ↓
Load Balancer DNS
  ↓
Listener
  ↓
Target Group
  ↓
Healthy EC2 Instances
  ↓
Auto Scaling Group adds/removes instances based on traffic.
```

This architecture provides:

* High Availability
* Fault Tolerance
* Scalability
* Automatic Recovery
* Better Performance
