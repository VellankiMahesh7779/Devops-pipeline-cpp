provider "aws" {
    region ="us-east-1"
}

variable "ami_id"{
}
variable "aws_instance_type"{

}

resource "aws_instance" "Mahesh"{
    ami =var.ami_id
    instance_type =var.aws_instance_type
    tags={
        Name= "Mahesh"
    }
}