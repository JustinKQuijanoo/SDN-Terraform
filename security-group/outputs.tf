###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Output for security group ID to be used for ec2-instances module in the root main.tf
output "security_group_id" {
  value = aws_security_group.SG-Hydrohomie.id
}
