// create a folder to house any automation related projects. This folder is configured to attach to the global-control-plane folder which is defined in the module-backend-meta module.
resource "google_folder" "backend_automation" {
  display_name = var.backend_automation_directory_display_name
  parent       = var.global_control_plane_folder_name
}

module "backend_cloud_build_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name              = "${local.project_prefix}cloud-build-project"
  random_project_id = true
  org_id            = var.org_id
  folder_id         = google_folder.backend_automation.name
  billing_account   = var.billing_account_id

  activate_apis = [
    "serviceusage.googleapis.com",
    "servicenetworking.googleapis.com",
    "cloudkms.googleapis.com",
    "compute.googleapis.com",
    "logging.googleapis.com",
    "bigquery.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "iam.googleapis.com",
    "admin.googleapis.com",
    "appengine.googleapis.com",
    "storage-api.googleapis.com",
    "monitoring.googleapis.com",
    "pubsub.googleapis.com",
    "securitycenter.googleapis.com",
    "accesscontextmanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]
}
