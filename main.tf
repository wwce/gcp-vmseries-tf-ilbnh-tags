# --------------------------------------------------------------------------------------------------------------------------
# Setup Terraform providers, pull the regions availability zones, and create naming prefix as local variable

terraform {}

provider "google" {
  #credentials = var.auth_file
  project     = var.project_id
  region      = var.regions[0]
}

data "google_compute_zones" "region0" {
  region = var.regions[0]
}

data "google_client_config" "main" {
}

data "google_compute_zones" "region1" {
  region = var.regions[1]
}

locals {
    prefix_region0 = "${var.regions[0]}"
    prefix_region1 = "${var.regions[1]}"
}