###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

# variable to be used for security group resource
variable "vpc_id" {
  description = "ID for VPC"
  type        = string
}
