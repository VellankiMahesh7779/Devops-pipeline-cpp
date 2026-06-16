# Terraform Installation & Commands

## Install Terraform on Ubuntu/Linux

### Add HashiCorp GPG Key
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
```
### Add HashiCorp Repository
```bash
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
```
### Update Packages
```bash
sudo apt update
```
### Install Terraform
```bash
sudo apt install terraform -y
```
### Verify Installation
```bash
terraform version
```
---
## Install Terraform on Windows (Chocolatey)

### Install Terraform
```powershell
choco install terraform -y
```
### Verify Installation
```powershell
terraform version
```
---
## Install Terraform on Windows (Manual Method)
### Download Terraform

Download Terraform ZIP from HashiCorp website.

### Create Terraform Directory
```powershell
mkdir C:\Terraform
```

### Extract ZIP File

Extract:
```text
terraform.exe
```
to:
```text
C:\Terraform
```
### Add Terraform to PATH

Open PowerShell as Administrator:

```powershell
[Environment]::SetEnvironmentVariable(
"Path",
$env:Path + ";C:\Terraform",
[EnvironmentVariableTarget]::Machine
)
```

### Verify Installation

Open a new terminal:
```powershell
terraform version
```

---

## Check Terraform Version
```bash
terraform version
```

---

## Initialize Terraform

```bash
terraform init
```

---

## Validate Configuration

```bash
terraform validate
```

---

## Format Terraform Files

```bash
terraform fmt
```

---

## Generate Execution Plan

```bash
terraform plan
```

---

## Create Infrastructure

```bash
terraform apply
```

### Skip Confirmation

```bash
terraform apply -auto-approve
```

---

## Show Terraform State

```bash
terraform show
```

---

## List Managed Resources

```bash
terraform state list
```

---

## Show Resource Details

```bash
terraform state show aws_instance.example
```

---

## Display Output Values

```bash
terraform output
```

---

## Preview Resource Destruction

```bash
terraform plan -destroy
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

### Skip Confirmation

```bash
terraform destroy -auto-approve
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
