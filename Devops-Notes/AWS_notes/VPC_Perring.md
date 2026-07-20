#  AWS VPC Peering & Transit Gateway

## Objective

Learn how to securely connect multiple VPCs using **VPC Peering** and **AWS Transit Gateway**.

---

# What is VPC Peering?

**VPC Peering** is a networking connection that allows **two VPCs to communicate privately** using AWS's internal network.

### Real-Time Example

Imagine two office buildings:

* **Office A** → Development Team
* **Office B** → Production Team

Instead of sending data over the public internet, a **private bridge** is built between them. Employees can communicate securely and quickly.

Similarly, VPC Peering creates a private connection between two VPCs.

```text
VPC A (10.0.0.0/16)
       │
       │ VPC Peering
       │
VPC B (20.0.0.0/16)
```

---

# Key Points

* Provides private communication between two VPCs.
* Uses AWS's internal network.
* Internet is not required.
* VPC CIDR blocks must **not overlap**.
* Route tables must be updated in both VPCs.
* Security Groups and NACLs must allow the required traffic.

---

# Advantages

* Secure communication
* Low latency
* High bandwidth
* Simple to configure

---

# Limitation of VPC Peering

VPC Peering **does not support transitive routing**.

Example:

```text
VPC A ←→ VPC B ←→ VPC C
```

Even though A is connected to B and B is connected to C, **A cannot communicate with C** unless another peering connection is created.

---

# What is AWS Transit Gateway?

**AWS Transit Gateway (TGW)** is a central networking hub that connects multiple VPCs and on-premises networks.

Instead of creating many VPC Peering connections, all VPCs connect to a single Transit Gateway.

### Real-Time Example

Think of a city with multiple roads.

Without Transit Gateway, every office needs a separate road to every other office.

With Transit Gateway, all offices connect to a **central highway**, making communication much simpler.

```text
          Transit Gateway
          /      |      \
         /       |       \
      VPC A    VPC B    VPC C
```

---

# Advantages of Transit Gateway

* Connects multiple VPCs through a single hub.
* Supports transitive routing.
* Easier to manage than multiple VPC Peering connections.
* Scales well for large AWS environments.
* Can connect VPCs, VPNs, and AWS Direct Connect.

---

# VPC Peering vs Transit Gateway

| VPC Peering                                        | Transit Gateway                            |
| -------------------------------------------------- | ------------------------------------------ |
| Connects two VPCs                                  | Connects multiple VPCs                     |
| No transitive routing                              | Supports transitive routing                |
| Suitable for small environments                    | Suitable for large enterprise environments |
| Many peering connections required as VPCs increase | Single central hub simplifies networking   |

---

# Key Takeaways

* **VPC Peering** is used to privately connect **two VPCs**.
* **Transit Gateway** is used to connect **multiple VPCs** through a central hub.
* VPC Peering does not support transitive routing, while Transit Gateway does.
* Transit Gateway is the preferred solution for large-scale AWS networking.
