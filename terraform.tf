terraform {
  required_providers {
    aws = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }
  }
  required_version = ">= 1.1.0"

  cloud {
    organization = "kelton-org"

    workspaces {
      name = "learn-terraform-cloud"
    }
  }
}
