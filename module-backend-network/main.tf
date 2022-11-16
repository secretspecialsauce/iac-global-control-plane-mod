terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

locals {
  project_prefix = var.project_prefix == "" ? "" : "${var.project_prefix}-"
}

// create a folder to house any network related projects. This folder is configured to attach to the global-control-plane folder which is defined in the module-backend-meta module.
resource "google_folder" "backend_network" {
  display_name = var.backend_network_directory_display_name
  parent       = var.global_control_plane_folder_name
}

module "backend_network_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "${local.project_prefix}network-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_network.name
  billing_account   = var.billing_account_id
}
