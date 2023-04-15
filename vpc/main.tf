###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Create a VPC block
resource "aws_vpc" "VPC-Hydrohomie" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "VPC-Hydrohomie" }
}

# Create internet gateway
resource "aws_internet_gateway" "IGW-Hydrohomie" {
  vpc_id = aws_vpc.VPC-Hydrohomie.id
  tags   = { Name = "IGW-Hydrohomie" }
}

# Create a public subnet
resource "aws_subnet" "SN-Pub-Hydrohomie" {
  vpc_id                  = aws_vpc.VPC-Hydrohomie.id
  count                   = var.counter
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = ["us-east-1a", "us-east-1b"][count.index]
  map_public_ip_on_launch = true
  tags                    = { Name = "SN-Pub-Hydrohomie-${count.index + 1}" }
}

# Create public route table 
resource "aws_route_table" "RTB-Pub-Hydrohomie" {
  vpc_id = aws_vpc.VPC-Hydrohomie.id
  route {
    cidr_block = var.default_route
    gateway_id = aws_internet_gateway.IGW-Hydrohomie.id
  }
  tags = { Name = "RTB-Pub-Hydrohomie" }
}

# Associate the public subnet and the public route table 
resource "aws_route_table_association" "public-access" {
  count          = var.counter
  subnet_id      = element(aws_subnet.SN-Pub-Hydrohomie.*.id, count.index)
  route_table_id = aws_route_table.RTB-Pub-Hydrohomie.id
}

