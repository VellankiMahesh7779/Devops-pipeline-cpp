# Terraform Commands

## Initialize Terraform

Downloads required providers and initializes the working directory.

```bash
terraform init
```

---

## Validate Configuration

Checks Terraform configuration syntax.

```bash
terraform validate
```

---

## Format Terraform Files

Formats Terraform code according to standard style.

```bash
terraform fmt
```

---

## Generate Execution Plan

Shows what Terraform will create, modify, or destroy.

```bash
terraform plan
```

---

## Create Infrastructure

Creates resources defined in Terraform configuration.

```bash
terraform apply
```

Skip confirmation:

```bash
terraform apply -auto-approve
```

---

## Show Terraform State

Displays the current state of managed infrastructure.

```bash
terraform show
```

---

## List Managed Resources

Lists resources stored in Terraform state.

```bash
terraform state list
```

---

## Show Resource Details

Displays detailed information about a specific resource.

```bash
terraform state show <resource_name>
```

Example:

```bash
terraform state show aws_instance.example
```

---

## Preview Resource Destruction

Shows resources that will be deleted.

```bash
terraform plan -destroy
```

---

## Destroy Infrastructure

Deletes all resources managed by Terraform.

```bash
terraform destroy
```

Skip confirmation:

```bash
terraform destroy -auto-approve
```

---

## Output Values

Displays output variables.

```bash
terraform output
```

---

## View Terraform Version

```bash
terraform version
```

---

## Common Terraform Workflow

```bash
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform destroy
```
