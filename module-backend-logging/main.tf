provider "google" {
    
}


module "logging_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 10.1"

  name                 = var.project_name
  random_project_id    = true
  org_id               = var.org_id
  # folder_id            = google_folder.logging.name
  billing_account      = var.billing_account_id

  activate_apis = [
    "bigquery.googleapis.com",
    "storage.googleapis.com",
  ]
}


//////////////////////////////////////////////////////
//// .   Cloud Storage Bucket for Logging     . //////
//////////////////////////////////////////////////////

// Create a new bucket to save the logs of all the projects in the organization
resource "google_storage_bucket" "logging_bucket" {
  name          = "${var.bucket_prefix}-${var.org_id}"
  project       = module.logging_project.project_id
  location      = var.location
  force_destroy = true
  retention_policy {
    is_locked = false
    retention_period = var.logs_retention_days * 24 * 60 * 60
  }
}


resource "google_logging_organization_sink" "gcs_org_sink" {
  name        = "gcs_org_sink"
  destination = "storage.googleapis.com/${google_storage_bucket.logging_bucket.name}"
  filter      = var.log_filter
  org_id      = var.org_id
  include_children = true
}

resource "google_project_iam_binding" "log_writer_gcs" {
    project = module.logging_project.project_id
    role = "roles/storage.objectCreator"
    members = [
        "${google_logging_organization_sink.gcs_org_sink.writer_identity}",
    ]
}



//////////////////////////////////////////////////////
//// .   BigQuery Dataset for Logging        . //////
//////////////////////////////////////////////////////

resource "google_bigquery_dataset" "logging_dataset" {
  project    = module.logging_project.project_id
  dataset_id                  = var.bq_dataset_id
  friendly_name               = var.bq_dataset_id
  description                 = "Org level BQ logging dataset"
  location                    = var.location
  default_table_expiration_ms = var.bq_table_expiration_ms 
}


resource "google_logging_organization_sink" "bq_org_sink" {
  name        = "bq_org_sink"
  destination = "bigquery.googleapis.com/projects/${module.logging_project.project_id}/datasets/${google_bigquery_dataset.logging_dataset.dataset_id}"
  filter      = var.log_filter
  org_id      = var.org_id
  include_children = true
}


resource "google_project_iam_binding" "log_writer_bq" {
    project = module.logging_project.project_id
    role = "roles/bigquery.dataEditor"
    members = [
        "${google_logging_organization_sink.bq_org_sink.writer_identity}",
    ]
}
