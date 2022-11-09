provider "google" {
    
}

resource "google_folder" "backend-automation" {
  display_name = var.automation_directory_display_name
  parent       = var.org_id
}

module "backend-billing-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-billing-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-billing
  billing_account      = var.billing_account_id

  activate_apis = [
    "cloudbilling.googleapis.com",
  ]
}