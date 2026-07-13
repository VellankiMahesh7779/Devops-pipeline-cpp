# 📅 Day 5 - Terraform State File, Remote Backend & State Locking

## ✅ Objective

Understand how Terraform tracks infrastructure, stores state, and enables team collaboration using a remote backend and state locking.

---

# 1. Terraform State File (`terraform.tfstate`)

The **terraform.tfstate** file stores information about the infrastructure created by Terraform.

It keeps track of resources such as:

- EC2 Instance ID
- Public IP Address
- Private IP Address
- Resource ARNs
- Dependencies

**Purpose:**

- Tracks Terraform-managed resources.
- Compares the current infrastructure with the desired configuration.
- Helps Terraform update or destroy resources correctly.

---

# 2. Desired State

The **Desired State** is the infrastructure you define in your Terraform (`.tf`) files.

Example:

```hcl
resource "aws_instance" "web" {
  instance_type = "t2.micro"
}
```

This tells Terraform:

> "I want an EC2 instance of type `t2.micro`."

---

# 3. Current State

The **Current State** is the infrastructure that currently exists and is tracked in the `terraform.tfstate` file.

Terraform compares the **Desired State** with the **Current State** to determine what changes are needed.

---

# 4. Remote Backend

A **Remote Backend** stores the Terraform state file in a shared location instead of the local machine.

The most common AWS setup is:

- **Amazon S3** → Stores the `terraform.tfstate` file.
- **Amazon DynamoDB** → Handles state locking.

**Benefits:**

- Enables team collaboration.
- Centralized state management.
- Prevents state file loss.
- Supports CI/CD pipelines.

---

# 5. State Locking

State Locking prevents multiple users from modifying the Terraform state file at the same time.

Without locking:

- Two users could run `terraform apply` simultaneously.
- This may corrupt the state file.

With locking:

- Only one user can update the state at a time.
- Other users must wait until the lock is released.

---

# 6. DynamoDB

DynamoDB is used to manage Terraform state locks.

When `terraform apply` starts:

- A lock is created in DynamoDB.

When the operation completes:

- The lock is automatically released.

This prevents concurrent modifications to the infrastructure.

---

# Terraform Workflow

```text
Terraform Code (.tf)
        ↓
Desired State
        ↓
terraform plan
        ↓
Compare with Current State
(terraform.tfstate)
        ↓
terraform apply
        ↓
State File Updated
(Local or Remote Backend)
```

---

# Summary

| Concept | Purpose |
|---------|---------|
| **terraform.tfstate** | Stores the current state and metadata of Terraform-managed resources. |
| **Desired State** | The infrastructure defined in your Terraform configuration files. |
| **Current State** | The infrastructure currently tracked by Terraform. |
| **Remote Backend** | Stores the Terraform state file in a shared location like Amazon S3. |
| **State Locking** | Prevents multiple users from modifying the state file simultaneously. |
| **DynamoDB** | Manages state locking when using an S3 remote backend. |

---


✔ Understood how State Locking prevents conflicts.

✔ Learned the role of Amazon S3 and DynamoDB in Terraform state management.
