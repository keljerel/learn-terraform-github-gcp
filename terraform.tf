terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.59.0"
    }
  }
  required_version = ">= 1.4.0"



  cloud {
    organization = "kelton-org"

    workspaces {
      name = "learn-terraform-cloud"
    }
  }
}
provider "google" {

  project = var.project
  region  = var.region
  zone    = var.zone
}
