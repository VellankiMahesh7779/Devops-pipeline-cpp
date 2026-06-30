# 📅 Day 4 - Terraform Variables and terraform.tfvars

# What are Variables in Terraform?

Variables are used to pass values into Terraform configurations.

Instead of writing values directly in the code, we can store them in variables and provide the values separately.

---

## ❌ Without Variables (Hardcoded)

```hcl
ami = "ami-0521cb2d60cfbb1a6"
instance_type = "t2.micro"
```

Every time you want to change the AMI or instance type, you must edit the code.

---

## ✅ With Variables

```hcl
ami = var.ami_id
instance_type = var.instance_type
```

Now the values can be changed without modifying the Terraform code.

---

# variables.tf

The `variables.tf` file is used to **declare variables**.

Example:

```hcl
variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  description = "The instance type for the EC2 instance"
}
```

This file only defines:

* Variable Name
* Description
* Type (optional)
* Default Value (optional)

It does **not** assign actual values.

---

# terraform.tfvars

The `terraform.tfvars` file is used to **assign values** to the variables.

Example:

```hcl
ami_id        = "ami-0521cb2d60cfbb1a6"
instance_type = "t2.micro"
```

# Example Flow

```text
Variable Name        Value
-------------        -----------------------
ami_id         --->  ami-0521cb2d60cfbb1a6
instance_type  --->  t2.micro
```

Terraform replaces:

```hcl
ami = var.ami_id
```

with

```hcl
ami = "ami-0521cb2d60cfbb1a6"
```

during execution.

---

# Benefits of Variables

✅ Avoid hardcoding values.

✅ Make code reusable.

✅ Easy to maintain.

✅ Support multiple environments (Dev, QA, Prod).

✅ Improve readability and flexibility.

---

# Variable Precedence (Interview Question)

Terraform reads variable values in the following order:

1. Command line (`-var`)
2. `.tfvars` file
3. Environment Variables (`TF_VAR_name`)
4. Default values in `variables.tf`

Example:

```bash
terraform apply -var="instance_type=t3.micro"
```

### Difference Between variables.tf and terraform.tfvars

| variables.tf                   | terraform.tfvars                     |
| ------------------------------ | ------------------------------------ |
| Declares variables             | Assigns values                       |
| Defines name and description   | Stores actual values                 |
| Optional defaults can be given | Used for environment-specific values |

---
