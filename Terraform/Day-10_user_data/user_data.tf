provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web_server" {

  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.allow_ssh.name]
  user_data = <<EOF
#!/bin/bash
dnf update -y
dnf install -y httpd
systemctl enable httpd
systemctl start httpd
echo "Welcome to Terraform User Data" > /var/www/html/index.html
EOF

  tags = {
    Name = "Web-Server"
  }
}
