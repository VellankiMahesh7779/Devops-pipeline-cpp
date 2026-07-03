variable "aws_region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0521cb2d60cfbb1a6"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "terraform-key"
}

variable "public_key_path" {
  default = "~/.ssh/id_ed25519.pub"
}

variable "volume_size" {
  default = 10
}