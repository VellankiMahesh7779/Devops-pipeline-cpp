# 📘 Terraform Import

## ✅ What is Terraform Import?

Terraform Import is used to bring an **existing resource** (created manually or outside Terraform) under **Terraform management**.

It adds the resource to the **Terraform State File (`terraform.tfstate`)** without creating a new resource.

### Uses
- Manage existing infrastructure with Terraform.
- Avoid recreating already existing resources.
- Bring manually created AWS resources into Infrastructure as Code (IaC).

---

# ✅ Tasks Completed

### Step 1: Created an EC2 Instance
- Created an EC2 instance manually from the AWS Console.

---

### Step 2: Created `main.tf`

Added the provider, resource block, and Import Block.

```hcl
import {
  id = "i-xxxxxxxxxxxxxxxxx"
  to = aws_instance.example
}
```

---

### Step 3: Initialized Terraform

```bash
terraform init
```

---

### Step 4: Generated Terraform Configuration

Ran the following command:

```bash
terraform plan -generate-config-out=generated_resources.tf
```

Terraform generated the configuration of the existing EC2 instance and stored it in:

```
generated_resources.tf
```

---

### Step 5: Updated `main.tf`

- Copied the generated resource configuration from `generated_resources.tf` to `main.tf`.
- Removed the `import` block.

---

### Step 6: Verified the Configuration

Ran:

```bash
terraform plan
```

Output:

```text
Plan: 1 to add, 0 to change, 0 to destroy.
```

This happened because the resource configuration existed, but it was **not yet added to the Terraform State File**.

---

### Step 7: Imported the Existing EC2

Ran:

```bash
terraform import aws_instance.example i-0b5146e8b54e6b602
```

Output:

```text
Import successful!

The resources that were imported are shown above.
These resources are now in your Terraform state and will henceforth be managed by Terraform.
```

The EC2 instance was successfully added to the Terraform State File.

---

### Step 8: Verified the Import

Ran:

```bash
terraform plan
```

Output:

```text
No changes. Your infrastructure matches the configuration.
```

This confirms that:

- Terraform Configuration ✔
- Terraform State ✔
- AWS Infrastructure ✔

are all in sync.

---

### Step 9: Destroyed the Resource

Ran:

```bash
terraform destroy
```

Terraform deleted the imported EC2 instance because it was now managing the resource.

---

# 📌 How Terraform Import Works

```text
EC2 Created Manually
        │
        ▼
Create Terraform Configuration
        │
        ▼
terraform init
        │
        ▼
Generate Configuration
(terraform plan -generate-config-out)
        │
        ▼
Copy Configuration to main.tf
        │
        ▼
terraform import
        │
        ▼
Resource Added to terraform.tfstate
        │
        ▼
terraform plan
        │
        ▼
No Changes
        │
        ▼
Terraform Now Manages the Resource
```

---

# 📚 Commands Used

```bash
terraform init

terraform plan -generate-config-out=generated_resources.tf

terraform plan

terraform import aws_instance.example <INSTANCE_ID>

terraform plan

terraform destroy
```

---

# 🎯 Learning Outcome

- Learned how to import existing AWS resources into Terraform.
- Understood the purpose of the Import Block.
- Generated Terraform configuration using `-generate-config-out`.
- Imported an existing EC2 instance into the Terraform State File.
- Verified that Terraform and AWS infrastructure were in sync.
- Managed and destroyed the imported resource using Terraform.
