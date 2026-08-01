provider "aws" {
  region = "us-east-1"
}
#usinfg for_each to create multiple instances with different names
# resource "aws_instance" "example" {
#   for_each      = toset(["Mahesh1", "Etasya", "vellanki3"])
#   ami           = "ami-0521cb2d60cfbb1a6"
#   instance_type = "t2.micro"
#   tags = {
#     Name = each.key
#   }

# }
#using for_each to create multiple instances with different instance types and names, 
#for.each is a map with key as name and value as instance type
resource "aws_instance" "server" {

  for_each = {

    Web_Server = "t2.micro"

    App_Server = "t2.small"

    DB_Server = "t2.medium"

  }

  ami = "ami-0521cb2d60cfbb1a6"

  instance_type = each.value

  tags = {

    Name = each.key

  }

}