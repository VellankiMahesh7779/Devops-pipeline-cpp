##################################################
# Web Server Outputs
##################################################

output "webserver_instance_id" {
  value = module.webserver.instance_id
}

output "webserver_public_ip" {
  value = module.webserver.instance_public_ip
}

output "webserver_private_ip" {
  value = module.webserver.instance_private_ip
}

##################################################
# DB Server Outputs
##################################################

output "dbserver_instance_id" {
  value = module.dbserver.instance_id
}

output "dbserver_public_ip" {
  value = module.dbserver.instance_public_ip
}

output "dbserver_private_ip" {
  value = module.dbserver.instance_private_ip
}

##################################################
# App Server Outputs
##################################################

output "appserver_instance_id" {
  value = module.appserver.instance_id
}

output "appserver_public_ip" {
  value = module.appserver.instance_public_ip
}

output "appserver_private_ip" {
  value = module.appserver.instance_private_ip
}