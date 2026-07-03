output "instance1_public_ip" {
  value = aws_instance.example1.public_ip
}

output "instance2_public_ip" {
  value = aws_instance.example2.public_ip
}
