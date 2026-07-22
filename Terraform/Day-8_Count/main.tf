provider "aws"{
    region ="us-east-1"
}

resource "aws_instance" "name"{
    count = 3
    ami = "ami-0521cb2d60cfbb1a6"
    instance_type = "t2.micro"

    tags ={
        Name = "Web-Server-${count.index + 1}"
    }
}