# Day 5 - Terraform Provisioners

## Objective

Learn how to use **Terraform Provisioners** to configure an EC2 instance automatically after it is created.

---

# What I Learned

## What is a Provisioner?

A **Provisioner** is a feature in Terraform that executes commands or scripts **after a resource is created**.

It is commonly used to:

* Install software
* Configure servers
* Copy files
* Execute shell commands

> **Note:** Provisioners should be used only when necessary. For production environments, tools like **Ansible** or **Cloud-Init (User Data)** are generally preferred.

---

# Types of Provisioners

## 1. Remote Provisioner (`remote-exec`)

The **remote-exec** provisioner runs commands on a **remote machine** (such as an AWS EC2 instance) using an SSH connection.

### Example Use Case

* Install Apache (httpd)
* Start the Apache service
* Enable Apache to start automatically on boot

Example:

```hcl
provisioner "remote-exec" {
  inline = [
    "sudo yum install httpd -y",
    "sudo systemctl start httpd",
    "sudo systemctl enable httpd"
  ]
}
```

---

## 2. Local Provisioner (`local-exec`)

The **local-exec** provisioner runs commands on the **local machine** where Terraform is executed.

### Example Use Case

* Save the EC2 public IP to a local file
* Display a success message after deployment

Example:

```hcl
provisioner "local-exec" {
  command = "echo ${self.public_ip} > instance_ip.txt"
}
```

---

## 3. File Provisioner (`file`)

The **file** provisioner copies files or directories from the **local machine** to the **remote EC2 instance**.

### Example Use Case

* Copy a website (`index.html`)
* Transfer configuration files
* Upload scripts

Example:

```hcl
provisioner "file" {
  source      = "index.html"
  destination = "/tmp/index.html"
}
```

---

# Connection Block

The **connection** block tells Terraform how to connect to the remote EC2 instance.

Example:

```hcl
connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("~/.ssh/id_ed25519")
  host        = self.public_ip
}
```

### Parameters

* **type** → Connection type (SSH)
* **user** → Login user (`ec2-user` for Amazon Linux)
* **private_key** → SSH private key
* **host** → Public IP of the EC2 instance

---

# What I Did Today

* Created an AWS EC2 instance using Terraform.
* Created a Security Group to allow SSH access (Port 22).
* Connected to the EC2 instance using the Terraform `connection` block.
* Used the `remote-exec` provisioner to:

  * Install Apache (`httpd`)
  * Start the Apache service
  * Enable Apache to start automatically after reboot
* Verified that Apache was successfully installed and running.

---

# Workflow

```text
Terraform Apply
        │
        ▼
Create Security Group
        │
        ▼
Create EC2 Instance
        │
        ▼
SSH Connection
        │
        ▼
Run Provisioner
        │
        ▼
Apache Installed & Running
```
# Key Takeaways

* Provisioners automate post-deployment tasks.
* `remote-exec` executes commands on the remote server.
* `local-exec` executes commands on the local machine.
* `file` transfers files from the local machine to the remote server.
* The `connection` block enables Terraform to establish an SSH connection to the EC2 instance.
* Provisioners are useful for learning and simple automation, but for large-scale production environments, configuration management tools such as Ansible or cloud-init are generally recommended.
