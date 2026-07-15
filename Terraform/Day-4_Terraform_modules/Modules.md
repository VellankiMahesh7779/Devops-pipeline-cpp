# Terraform Modules

## What is a Module?

A **Terraform Module** is a collection of Terraform configuration files (`.tf`) stored in a directory. Modules help organize and reuse infrastructure code instead of writing the same resources multiple times.

> **In simple words:** A module is like a function in programming—you write the infrastructure once and use it many times with different input values.

---

## Why Use Modules?

* Reuse the same code across multiple environments.
* Reduce duplicate code.
* Keep Terraform projects clean and organized.
* Simplify maintenance.
* Improve scalability and consistency.

---

## Types of Modules

### 1. Root Module

The directory where you run Terraform commands.

```bash
terraform init
terraform plan
terraform apply
```

### 2. Child Module

A reusable module that is called from the root module using the `module` block.

## Module Workflow

```text
Root Module
     │
     ▼
Calls Child Module
     │
     ▼
Passes Input Variables
     │
     ▼
Child Module Creates Resources
     │
     ▼
AWS Resources Created
```

---

## Module Sources

### Local Module

```terraform
source = "./modules/ec2"
```

### Git Repository

```terraform
source = "git::https://github.com/company/ec2-module.git"
```

### Terraform Registry

```terraform
source = "terraform-aws-modules/vpc/aws"
```

---

## Advantages

* Reusable code
* Easy maintenance
* Less duplication
* Better organization
* Faster infrastructure deployment
* Consistent environments

---
