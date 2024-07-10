# Enforce minimum Terraform and provider version numbers.
terraform {
  required_providers {

    harvester = {
      source  = "harvester/harvester"
      version = "0.6.4"
    }
  }

  required_version = ">= 1.8.5"
}
