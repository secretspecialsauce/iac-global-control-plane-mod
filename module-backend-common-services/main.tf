provider "google" {

}

// create a folder to house any common services related projects. This folder is configured to attach to the global-control-plane folder which is defined in the module-backend-meta module.
resource "google_folder" "backend_common_services" {
  display_name = var.backend_common_services_directory_display_name
  parent       = var.global_control_plane_folder_name
}

module "backend_ad_hosts_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "b-ad-hosts-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_common_services.name
  billing_account   = var.billing_account_id

}

module "backend_bq_datasets_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "b-bq-datasets-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_common_services.name
  billing_account   = var.billing_account_id

  activate_apis = [
    "bigquery.googleapis.com",
  ]
}