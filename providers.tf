###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.62.0"
    }
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["~/.aws/credentials"]
}
