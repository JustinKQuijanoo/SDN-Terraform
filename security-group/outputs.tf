###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

# Output for security group ID to be used for ec2-instances module in the root main.tf
output "security_group_id" {
  value = aws_security_group.SG-Hydrohomie.id
}
