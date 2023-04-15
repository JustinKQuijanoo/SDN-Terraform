###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Variables for load-balancer module

data "aws_vpc" "VPC-Hydrohomie" {
  id = var.vpc_id
}

output "alb_dns_name" {
  description = "DNS name of load balancer"
  value = aws_lb.LB-Hydrohomie.dns_name
}


