# The configuration for the `remote` backend.
terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "vgonzcam-btp"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "vgonzcam-btp"
    }
  }


  cloud {

    organization = "vgonzcam-btp"

    workspaces {
      name = "vgonzcam-btp"
    }

  }
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "1.8.0"
    }
  }
}

provider "btp" {
  globalaccount = "c2d80553trial-ga"
}



# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}

data "btp_directories" "all" {}

output "btp_directories-all" {
  value = btp_directories.all
}

