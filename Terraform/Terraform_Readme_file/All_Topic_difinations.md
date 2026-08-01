# Terraform Important Concepts

## ✅ Provider
A Provider is a plugin that allows Terraform to interact with cloud platforms like AWS, Azure, or GCP.

**Example:**
```hcl
provider "aws" {
  region = "us-east-1"
}
```

---

## ✅ Resource
A Resource is any infrastructure component created and managed by Terraform.

**Example:**
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t2.micro"
}
```

---

## ✅ Variables
Variables allow you to pass values dynamically instead of hardcoding them.

**Example:**
```hcl
variable "instance_type" {}
```

---

## ✅ Outputs
Outputs display useful information after Terraform creates resources.

**Example:**
```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

---

## ✅ Modules
A Module is a reusable collection of Terraform code.

**Example:**
```hcl
module "ec2" {
  source = "./modules/ec2"
}
```

---

## ✅ Workspaces
Workspaces allow you to manage multiple environments using the same Terraform code.

**Example:**
```bash
terraform workspace new dev
```

---

## ✅ Terraform State File (`terraform.tfstate`)
The State File stores information about the infrastructure managed by Terraform.

**Example:**
```text
terraform.tfstate
```

---

## ✅ Remote Backend
A Remote Backend stores the Terraform State File in a shared location such as Amazon S3.

**Example:**
```hcl
backend "s3" {
  bucket = "terraform-state-bucket"
}
```

---

## ✅ State Locking
State Locking prevents multiple users from updating the state file simultaneously.

**Example:**
```hcl
dynamodb_table = "terraform-locks"
```

---

## ✅ Drift
Drift occurs when infrastructure is changed manually outside Terraform.

**Example:**

Terraform:
```text
t2.micro
```

AWS Console:
```text
t2.small
```

---

## ✅ Import
Import brings existing cloud resources under Terraform management.

**Example:**
```bash
terraform import aws_instance.web i-0123456789abcdef0
```

---

## ✅ Provisioners
Provisioners run scripts or commands after a resource is created or destroyed.

**Example:**
```hcl
provisioner "local-exec" {
  command = "echo EC2 Created"
}
```

---

## ✅ Count
`count` creates multiple identical resources.

**Example:**
```hcl
count = 3
```

Creates:
- EC2-1
- EC2-2
- EC2-3

---

## ✅ for_each
`for_each` creates multiple resources with different names or configurations.

**Example:**
```hcl
for_each = toset(["Web", "App", "DB"])
```

Creates:
- Web
- App
- DB

---

## ✅ User Data
User Data runs a script automatically when an EC2 instance starts.

**Example:**
```hcl
user_data = file("install_apache.sh")
```

---

## ✅ Data Sources
Data Sources fetch information about existing resources without creating them.

**Example:**
```hcl
data "aws_ami" "latest" {
  most_recent = true
}
```
