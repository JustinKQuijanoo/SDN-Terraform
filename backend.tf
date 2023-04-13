terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "Hydrohomie-training"

    workspaces {
      name = "SDN-Lab3-Terraform"
    }

  }
}
