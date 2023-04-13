###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# variable to be used for security group resource
variable "vpc_id" {
  description = "ID for VPC"
  type        = string
}
