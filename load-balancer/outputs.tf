###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Variables for load-balancer module

data "aws_vpc" "VPC-Hydrohomie" {
  id = var.vpc_id
}

# data "aws_subnets" "SN-Hydrohomie" {
#   filter {
#     name   = "vpc-id"
#     values = [var.vpc_id]
#   }
# }

# data "aws_subnet" "SN-Hydrohomie" {
#   for_each = toset(data.aws_subnets.example.ids)
#   id       = each.value
# }


