provider "aws" {
    alias = "us-east-1"
  region = "us-east-1"
}
provider "aws" {
    alias = "us-west-2"
  region = "us-west-2"
}

resource "aws_instance" "example1" {
  
  provider = aws.us-east-1
  ami           = "ami-0521cb2d60cfbb1a6" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"

  tags = {
    Name = "TerraformExampleInstance1"
  }
}

resource "aws_instance" "example2" {
    
  provider = aws.us-west-2
  ami           = "ami-0cb473a1f3c06c13d" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExampleInstance2"
  }
}