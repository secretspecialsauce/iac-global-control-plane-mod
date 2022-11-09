provider "google" {
    
}

resource "google_folder" "backend-automation" {
  display_name = var.automation_directory_display_name
  parent       = var.org_id
}

// Create project for cloud build
module "backend-cloud-build-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-cloud-build-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-automation
  billing_account      = var.billing_account_id

  activate_apis = [
    "cloudbuild.googleapis.com",
  ]
}
