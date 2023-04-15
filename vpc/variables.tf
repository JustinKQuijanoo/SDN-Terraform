###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Variables for vpc module
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
}

variable "cidr_block" {
  description = "Address space for VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "Address space for subnets"
  type        = list(any)
}

variable "counter" {
  type    = number
  default = 2
}

variable "default_route" {
  description = "Default route for route table"
  default     = "0.0.0.0/0"
}
