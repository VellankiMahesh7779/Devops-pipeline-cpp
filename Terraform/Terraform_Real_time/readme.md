# Terraform AWS Infrastructure

## Project Structure

provider.tf
- AWS Provider Configuration

vpc.tf
- VPC Creation

subnet.tf
- Public Subnet 1
- Public Subnet 2

igw.tf
- Internet Gateway

route-table.tf
- Route Table
- Default Route (0.0.0.0/0)
- Route Table Associations

security-group.tf
- Security Group
- Key Pair

ec2.tf
- EC2 Instances

s3.tf
- S3 Bucket

---

## Creation Process

1. Configure AWS Provider
2. Create VPC
3. Create Public Subnets
4. Create Internet Gateway
5. Create Route Table
6. Associate Route Table with Subnets
7. Create Security Group
8. Create Key Pair
9. Launch EC2 Instances
10. Create S3 Bucket

---

## Terraform Commands

```bash
terraform init
```

```bash
terraform fmt
```

```bash
terraform validate
```

```bash
terraform plan
```

```bash
terraform apply
```

```bash
terraform destroy
```
