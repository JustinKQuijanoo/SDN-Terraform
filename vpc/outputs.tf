###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

output "subnet_ids" {
  value = aws_subnet.SN-Hydrohomie[*].id
}

# Output for VPC ID to be used for security-group module in the root main.tf
output "vpc_id" {
  value = aws_vpc.VPC-Hydrohomie.id
}
