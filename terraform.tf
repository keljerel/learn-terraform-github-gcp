terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
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

  credentials = file(var.credentials_file)
  project = var.project
  region  = var.region
  zone    = var.zone
  }
