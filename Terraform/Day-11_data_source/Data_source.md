# ✅ Day 11 - Terraform Data Sources

## What is a Data Source?

A Data Source is used to **read information about an existing resource** without creating or managing it.

```text
Resource     → Create / Manage
Data Source  → Read / Use
Import       → Bring under Terraform management
```

## Why Use Data Sources?

- Avoid hardcoding resource information.
- Use existing AWS resources.
- Dynamically retrieve values such as AMI IDs.

## Example - Ubuntu AMI

```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}
```

Use the retrieved AMI in EC2:

```hcl
resource "aws_instance" "ubuntu_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
}
```

## Common Data Sources

- `aws_ami` → Find an AMI
- `aws_vpc` → Read an existing VPC
- `aws_subnet` → Read an existing Subnet
- `aws_security_group` → Read an existing Security Group

## Key Point

> **Data Source reads existing information; it does not create or take ownership of the resource.**

## Learning Outcome

✔ Learned what Data Sources are.  
✔ Understood Resource vs Data Source vs Import.  
✔ Learned how to find an existing AMI.  
✔ Learned how to use a Data Source value in an EC2 resource.
