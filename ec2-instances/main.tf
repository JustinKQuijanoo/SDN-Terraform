###
# Author: Justin Quijano
# Class: SYST35144 Cloud Systems
# Lab 3 - Terraform
###

# Deploy a public production EC2 instance
resource "aws_instance" "Prod-EC2" {
  count           = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_id
  key_name        = "KeyS144"
  security_groups = [var.security_group_id]
  user_data       = file("./ec2-instances/user-data.sh")
  tags            = { Name = "Prod-WS${count.index + 1}" }
}

# Deploy a private development EC2 instance 
resource "aws_instance" "Dev-EC2" {
  count           = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.private_subnet_id
  key_name        = var.key_file
  security_groups = [var.security_group_id]
  user_data       = file("./ec2-instances/user-data.sh")
  tags            = { Name = "Dev-WS${count.index + 1}" }
}
