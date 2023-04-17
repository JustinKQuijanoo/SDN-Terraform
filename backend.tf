###
# Author: Justin Quijano
# Class: TELE36058 Software Defined Networks
# Lab 3 - Terraform Project
###

terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "Hydrohomie-training"

    workspaces {
      name = "SDN-Lab3-Terraform"
    }

  }
}
