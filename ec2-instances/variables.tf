###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Variables for ec2-instances module
variable "ami" {
  description = "AMI image"
  default     = "ami-0aa7d40eeae50c9a9"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "private_subnet_id" {
  description = "ID for private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID for public subnet"
  type        = string
}

variable "security_group_id" {
  description = "ID for security group"
  type        = string
}
