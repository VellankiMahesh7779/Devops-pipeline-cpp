# ✅ Day 10 - Terraform User Data

## What is User Data?

User Data is a **startup script** that automatically runs when an EC2 instance launches for the first time.

It is used to automatically install software and configure the server.

## Why Use User Data?

- Install packages automatically.
- Start and enable services.
- Configure the server during startup.
- Avoid manual SSH configuration.

## Example

```hcl
user_data = <<EOF
#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl enable httpd
systemctl start httpd
echo "Welcome to Terraform User Data" > /var/www/html/index.html
EOF
```

This automatically:

```text
EC2 Launch
    ↓
User Data Runs
    ↓
Install Apache
    ↓
Start Apache
    ↓
Create index.html
```

## What is `EOF`?

`EOF` is used to define a **multi-line script**.

Everything between:

```text
<<EOF
   ↓
Script
   ↓
EOF
```

is treated as one block of text.

## User Data vs Provisioners

| User Data | Provisioners |
|---|---|
| Runs during EC2 startup | Runs after resource creation |
| Used for initial server configuration | Used for additional commands |
| Preferred for EC2 bootstrapping | Use when necessary |

## Learning Outcome

✔ Learned what User Data is.  
✔ Learned how to configure EC2 automatically during startup.  
✔ Learned how to install Apache using User Data.  
✔ Learned how to create an HTML page automatically.  
✔ Learned the purpose of `EOF`.
