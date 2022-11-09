provider "google" {
    
}

resource "google_folder" "backend-automation" {
  display_name = var.automation_directory_display_name
  parent       = var.org_id
}

module "backend-kms-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-kms-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-security
  billing_account      = var.billing_account_id

  activate_apis = [
    "cloudkms.googleapis.com",
  ]
}

module "backend-secret-manager-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-secret-manager-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-security
  billing_account      = var.billing_account_id

  activate_apis = [
    "secretmanager.googleapis.com",
  ]
}

module "backend-forensic-logs-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-forensic-logs-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-security
  billing_account      = var.billing_account_id

  activate_apis = [
    "",
  ]
}

module "backend-artifacts-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-artifacts-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-security
  billing_account      = var.billing_account_id

  activate_apis = [
    "artifactregistry.googleapis.com",
  ]
}
