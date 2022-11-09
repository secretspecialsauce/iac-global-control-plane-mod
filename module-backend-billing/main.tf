provider "google" {

}

// create a folder to house any billing related projects. This folder is configured to attach to the global-control-plane folder which is defined in the module-backend-meta module.
resource "google_folder" "backend_billing" {
  display_name = var.backend_billing_directory_display_name
  parent       = var.global_control_plane_folder_name
}

module "backend_billing_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "b-billing-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_billing.name
  billing_account   = var.billing_account_id

  activate_apis = [
    "cloudbilling.googleapis.com",
  ]
}