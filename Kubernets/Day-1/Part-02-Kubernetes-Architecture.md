# Kubernetes Day 1 — Part 2: Kubernetes Architecture

Part 1 explained:

```text
Cluster → Node → Pod → Container
```

Now we will understand the **main components that manage the cluster**.

---

# 1. Control Plane ⭐

**Definition:**
The Control Plane is the **brain of a Kubernetes cluster**. It makes decisions and manages the overall state of the cluster.

**Simple meaning:**
Control Plane = **Manager / Brain**

```text
              Control Plane
                   🧠
                    |
          Manages the Cluster
                    |
          +---------+---------+
          |                   |
       Worker Node         Worker Node
```

**Real-life example — Restaurant 🍽️**

The restaurant manager decides:

* How many workers are needed
* Where work should happen
* Whether something needs to be replaced

Similarly, the Control Plane manages Kubernetes workloads.

---

# 2. Worker Node

**Definition:**
A Worker Node is a **machine in the Kubernetes cluster where application Pods run**.

**Simple meaning:**
Worker Node = **Machine that does the actual work**

```text
Control Plane
     |
     ↓
Worker Node
     |
     ↓
Pod
     |
Container
```

**Real-life example — Shop 🏪**

```text
Company Manager
      ↓
Shop
      ↓
Employees
```

The manager makes decisions, while employees perform the actual work.

Similarly:

```text
Control Plane → Makes decisions
Worker Node   → Runs applications
```

---

# 3. API Server ⭐

**Definition:**
The API Server is the **main communication interface through which users and Kubernetes components interact with the cluster**.

**Simple meaning:**
API Server = **Front door of Kubernetes**

```text
You
 |
 | kubectl
 ↓
API Server
 ↓
Kubernetes Cluster
```

For example:

```text
kubectl get pods
```

The `kubectl` command communicates with the API Server.

**Real-life example — Shop 🏪**

```text
Customer
   ↓
Shop Counter
   ↓
Shop Management
```

The customer communicates through the counter instead of directly accessing the management system.

---

# 4. etcd

**Definition:**
etcd is the **key-value database that stores important Kubernetes cluster state and configuration information**.

**Simple meaning:**
etcd = **Kubernetes' database / memory**

```text
Kubernetes
    |
   etcd
    |
Cluster Information
```

It stores information about things such as:

* Nodes
* Pods
* Configuration
* Cluster state

**Important:**
etcd does **not** run your application.

It stores Kubernetes information.

**Real-life example — Shop 🏪**

A shop database might store:

```text
Employees → 20
Products  → 500
Branches  → 5
```

Similarly, etcd stores important Kubernetes cluster information.

---

# 5. Scheduler ⭐

**Definition:**
The Scheduler decides **which suitable Worker Node should run a newly created Pod**.

**Simple meaning:**
Scheduler = **Chooses where a Pod should run**

```text
New Pod
   |
   ↓
Scheduler
   |
   +---- Node 1 ❌
   |
   +---- Node 2 ✅
   |
   +---- Node 3 ❌
```

The Scheduler considers available resources and scheduling rules before selecting a Node.

**Real-life example — Railway 🚆**

Suppose:

```text
Train 1 → Full
Train 2 → Available
Train 3 → Maintenance
```

The railway system selects Train 2 for new passengers.

Similarly, the Scheduler selects a suitable Node for a Pod.

---

# 6. Controller Manager ⭐

**Definition:**
The Controller Manager runs controllers that **continuously monitor the cluster and work to make the actual state match the desired state**.

**Simple meaning:**
Controller Manager = **Checks and maintains the desired condition**

Example:

```text
Desired State = 3 Pods
Actual State  = 2 Pods
```

Controller notices the difference:

```text
2 ≠ 3
```

Kubernetes works to create another Pod:

```text
Desired State = 3 Pods
Actual State  = 3 Pods ✅
```

**Real-life example — Restaurant 🍽️**

Owner says:

```text
I need 5 waiters.
```

But currently:

```text
Only 4 waiters.
```

The manager arranges another waiter.

```text
Desired = 5
Actual  = 5 ✅
```

---

# ⭐ Control Plane Components

Remember these four main components:

```text
                 CONTROL PLANE
                      🧠
                       |
        +--------------+--------------+
        |              |              |
    API Server      Scheduler    Controller
                                    Manager
        |
       etcd
```

### Their jobs:

```text
API Server
    ↓
Communication

etcd
    ↓
Stores cluster information

Scheduler
    ↓
Chooses Node for Pod

Controller Manager
    ↓
Maintains desired state
```

---

# ⭐ Control Plane vs Worker Node

This is very important.

```text
        CONTROL PLANE
             🧠
             |
      Makes decisions
             |
             ↓
      WORKER NODES
          💪 💪
             |
          Run Pods
             |
        Containers
             |
       Applications
```

### Easy memory trick

**Control Plane = Think**

**Worker Node = Work**

---

# 🧠 Day 1 Part 2 — Quick Revision

| Topic              | Short Definition                                  |
| ------------------ | ------------------------------------------------- |
| Control Plane      | Brain that manages the Kubernetes cluster         |
| Worker Node        | Machine where application Pods run                |
| API Server         | Main communication interface for Kubernetes       |
| etcd               | Database that stores Kubernetes cluster state     |
| Scheduler          | Chooses a suitable Node for a Pod                 |
| Controller Manager | Works to keep actual state matching desired state |

## 🎯 One-Line Memory Trick

**Control Plane manages → API Server communicates → etcd stores → Scheduler chooses → Controller Manager maintains → Worker Nodes run Pods.**
