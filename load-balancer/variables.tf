variable "ami" {
  description = "AMI for launch configuration"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_subnet_id" {
  description = "ID for private subnet"
  type        = string
}

variable "public_subnet_id" {
  description = "ID for public subnet"
  type        = string
}

variable "vpc_id" {
  description = "ID for VPC"
  type        = string
}

variable "security_group_id" {
  description = "ID for security group"
  type        = string
}
