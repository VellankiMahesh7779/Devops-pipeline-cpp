module "webserver" {

  source = "./modules/ec2"

  ami_id = "ami-0521cb2d60cfbb1a6"

  instance_type = "t2.micro"

  name = "WebServer"

}
module "dbserver" {

  source = "./modules/ec2"

  ami_id = "ami-0521cb2d60cfbb1a6"

  instance_type = "t2.micro"

  name = "DBServer"

}
module "appserver" {

  source = "./modules/ec2"

  ami_id = "ami-0521cb2d60cfbb1a6"

  instance_type = "t2.micro"

  name = "AppServer"

}