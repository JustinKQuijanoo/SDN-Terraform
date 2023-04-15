###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Module for VPC
module "vpc" {
  source       = "./vpc"
  aws_region   = "us-east-1"
  vpc_name     = "VPC-Hydrohomie"
  cidr_block   = "172.16.0.0/16"
  subnet_cidrs = ["172.16.0.0/24", "172.16.1.0/24"]
  counter      = 2
}

# Module for security groups
module "security-group" {
  source = "./security-group"
  vpc_id = module.vpc.vpc_id
}

# Module for load balancers
module "load-balancer" {
  source            = "./load-balancer"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = module.vpc.subnet_ids
  security_group_id = module.security-group.security_group_id
}

output "alb_dns_name" {
  value = module.load-balancer.alb_dns_name
}
