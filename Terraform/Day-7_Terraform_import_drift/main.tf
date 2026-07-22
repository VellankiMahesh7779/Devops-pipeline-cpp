provider "aws" {
  region = "us-east-1"
}
#this block added to import the existing resource into terraform state file, 
#After copying the resource block from AWS console to main.tf file, 
#we can use this block to import the existing resource into terraform state file.
# I removed imort block because I have already imported the resource into terraform state file using below command
# import {
#     id = "i-0e3f1c8b9e4f5a6b7"

#     to = aws_instance.example
# }

resource "aws_instance" "example" {
  ami                                  = "ami-0b826bb6d96d2afe4"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1a"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  key_name                             = "mynewkwy"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.31.32.236"
  region                               = "us-east-1"
  secondary_private_ips                = []
  security_groups                      = ["launch-wizard-44"]
  source_dest_check                    = true
  subnet_id                            = "subnet-04db1a9a4b3bd9573"
  tags = {
    Name = "test1"
  }
  tags_all = {
    Name = "test1"
  }
  tenancy                     = "default"
  user_data                   = null
  user_data_replace_on_change = null
  volume_tags                 = null
  vpc_security_group_ids      = ["sg-0cc2504b30d7304bf"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
