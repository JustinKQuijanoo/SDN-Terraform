###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

variable "subnet_ids" {
  description = "IDs for subnets"
  type        = list(any)
}

variable "vpc_id" {
  description = "ID for VPC"
  type        = string
}

variable "security_group_id" {
  description = "ID for security group"
  type        = string
}

variable "ami" {
  description = "AMI image"
  default     = "ami-0aa7d40eeae50c9a9"
}

variable "min_size" {
  description = "Minimum value for EC2 cluster"
  default     = 3
}

variable "max_size" {
  description = "Maximum value for EC2 cluster"
  default     = 6
}
variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
