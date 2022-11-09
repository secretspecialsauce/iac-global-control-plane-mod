provider "google" {
    
}

resource "google_folder" "backend-automation" {
  display_name = var.automation_directory_display_name
  parent       = var.org_id
}

module "backend-ad-hosts-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-ad-hosts-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-common-services
  billing_account      = var.billing_account_id

}

module "backend-bq-datasets-project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = "backend-bq-datasets-project"
  random_project_id    = true
  org_id               = var.org_id
  folder_id            = google_folder.backend-common-services
  billing_account      = var.billing_account_id

  activate_apis = [
    "bigquery.googleapis.com",
  ]
}