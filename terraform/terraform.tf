provider "aws" {
  region = "us-east-1"
  access_key = "AccessKey"
  secret_key = "SecretKey"
}

resource "aws_instance" "example" {
  ami           = "ami-0521cb2d60cfbb1a6" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"

  tags = {
    Name = "TerraformExampleInstance"
  }
}
