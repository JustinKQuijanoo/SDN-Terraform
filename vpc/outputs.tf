###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

output "subnet_ids" {
  value = aws_subnet.SN-Pub-Hydrohomie[*].id
}

# Output for VPC ID to be used for security-group module in the root main.tf
output "vpc_id" {
  value = aws_vpc.VPC-Hydrohomie.id
}
