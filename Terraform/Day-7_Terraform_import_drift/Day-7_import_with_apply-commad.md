# 📘 Terraform Import (Using Import Block)

## ✅ What is Terraform Import?

Terraform Import is used to bring an existing resource under Terraform management. It adds the resource to the Terraform State File without creating a new resource.

---

## ✅ Tasks Completed

### 1. Created an EC2 instance manually from the AWS Console.

### 2. Created `main.tf` with the resource block and Import Block.

```hcl
import {
  id = "i-xxxxxxxxxxxxxxxxx"
  to = aws_instance.example
}
```

### 3. Initialized Terraform.

```bash
terraform init
```

### 4. Generated the Terraform configuration.

```bash
terraform plan -generate-config-out=generated_resources.tf
```

Terraform generated the resource configuration in:

```
generated_resources.tf
```

### 5. Copied the generated configuration into `main.tf` and removed the Import Block.

### 6. Verified the configuration.

```bash
terraform plan
```

Output:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

The resource existed in AWS but was not yet in the Terraform State.

### 7. Imported the resource automatically.

```bash
terraform apply
```

Terraform imported the existing EC2 into the state file instead of creating a new one.

### 8. Verified the import.

```bash
terraform plan
```

Output:

```text
No changes. Your infrastructure matches the configuration.
```

### 9. Destroyed the imported resource.

```bash
terraform destroy
```

---

## 📚 Commands Used

```bash
terraform init

terraform plan -generate-config-out=generated_resources.tf

terraform plan

terraform apply

terraform plan

terraform destroy
```

---

## 🎯 Learning Outcome

- Learned how to import an existing AWS resource using the Import Block.
- Generated Terraform configuration automatically.
- Imported the EC2 into the Terraform State File.
- Verified that Terraform configuration, state, and AWS infrastructure were in sync.
- Managed and destroyed the imported resource using Terraform.
