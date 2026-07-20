# ✅ Day 6 - Terraform Workspaces

## Topics Covered

- Terraform Workspaces
- Environment-based Infrastructure (Dev, QA, Prod)
- `lookup()` Function
- Map Variables
- Default Values

---

## What is a Workspace?

A Terraform Workspace allows you to manage multiple environments (Dev, QA, Prod) using the same Terraform code.

Instead of creating separate projects for each environment, we can switch between workspaces.

### Example

- dev
- qa
- prod

Each workspace maintains its own Terraform state file.

---

## Workspace Commands

### Show Current Workspace

```bash
terraform workspace show
```

### List All Workspaces

```bash
terraform workspace list
```

### Create a New Workspace

```bash
terraform workspace new dev
```

### Switch Workspace

```bash
terraform workspace select qa
```

### Delete Workspace

```bash
terraform workspace delete dev
```

---

## Map Variable

```hcl
default = {
  dev  = "t2.micro"
  qa   = "t2.medium"
  prod = "t2.small"
}
```

This map stores different EC2 instance types for different environments.

Example:

- **dev** → `t2.micro`
- **qa** → `t2.medium`
- **prod** → `t2.small`

---

## lookup() Function

```hcl
aws_instance_type = lookup(var.aws_instance_type, terraform.workspace, "t2.micro")
```

### Explanation

- `var.aws_instance_type` → Map containing instance types.
- `terraform.workspace` → Gets the current workspace name.
- `"t2.micro"` → Default value if the workspace name is not found.

### Example

| Workspace | Instance Type |
|-----------|---------------|
| dev | t2.micro |
| qa | t2.medium |
| prod | t2.small |
| test | t2.micro (Default) |

---

## Why is the Default Value Needed?

```hcl
lookup(map, key, default)
```

If the workspace doesn't exist in the map, Terraform uses the **default value** instead of showing an error.

Example:

Current Workspace:

```text
test
```

Since `test` is not available in the map:

```hcl
default = "t2.micro"
```

Terraform launches the EC2 instance with **t2.micro**.

---

## Learning Outcome

✔ Learned how to create and switch Terraform Workspaces.

✔ Used a single Terraform codebase for Dev, QA, and Prod environments.

✔ Used Map Variables to assign different EC2 instance types.

✔ Learned how the `lookup()` function selects values based on the current workspace.
