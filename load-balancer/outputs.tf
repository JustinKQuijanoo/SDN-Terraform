###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

# Variables for load-balancer module

data "aws_vpc" "VPC-Hydrohomie" {
  id = var.vpc_id
}

data "aws_subnets" "VPC-Hydrohomie" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}

output "alb_dns_name" {
  description = "DNS name of load balancer"
  value       = aws_lb.LB-Hydrohomie.dns_name
}


