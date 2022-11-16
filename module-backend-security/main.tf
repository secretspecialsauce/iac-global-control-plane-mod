terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

// create a folder to house any security related projects. This folder is configured to attach to the global-control-plane folder which is defined in the module-backend-meta module.
resource "google_folder" "backend_security" {
  display_name = var.backend_security_directory_display_name
  parent       = var.global_control_plane_folder_name
}

locals {
  project_prefix = var.project_prefix == "" ? "" : "${var.project_prefix}-"
}

module "backend_kms_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "${local.project_prefix}kms-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_security.name
  billing_account   = var.billing_account_id

  activate_apis = [
    "cloudkms.googleapis.com",
  ]
}

module "backend_secret_manager_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "${local.project_prefix}secrets-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_security.name
  billing_account   = var.billing_account_id

  activate_apis = [
    "secretmanager.googleapis.com",
  ]
}

module "backend_forensic_logs_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "${local.project_prefix}logs-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_security.name
  billing_account   = var.billing_account_id

  activate_apis = [

  ]
}

module "backend_artifacts_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "${local.project_prefix}artifacts-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_security.name
  billing_account   = var.billing_account_id

  activate_apis = [
    "artifactregistry.googleapis.com",
  ]
}
