resource "aws_instance" "Vellanki" {
  count         = 2
  ami           = "ami-0521cb2d60cfbb1a6"
  instance_type = "t2.micro"

  subnet_id = aws_subnet.Public_subnet1.id
  vpc_security_group_ids = [
    aws_security_group.web_sg.id
  ]
  associate_public_ip_address = true
  tags = {
    Name = "Vellanki-${count.index + 1}"
  }
}