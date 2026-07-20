provider "aws" {
  region = "us-east-1"
}

variable "ami_id" {
  description = "value"
}

variable "aws_instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "qa" = "t2.medium"
    "prod" = "t2.small"
  }
}

module "ec2instance" {
  source = "./module/ec2instance"
  ami_id = var.ami_id
  aws_instance_type = lookup(var.aws_instance_type, terraform.workspace, "t2.micro")
}