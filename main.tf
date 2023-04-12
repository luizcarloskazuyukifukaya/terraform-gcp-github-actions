# Required Providers
terraform {
  required_version = ">= 1.2.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">=4.51.0"
    }
  }
}

# Variables
variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

# Provider
provider "google" {
  project = var.project_id
  region  = var.region
}

