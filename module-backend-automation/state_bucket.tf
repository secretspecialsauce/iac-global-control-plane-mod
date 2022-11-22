resource "google_storage_bucket" "state" {
  name          = "${var.project_prefix}-tf-state"
  project       = module.backend_cloud_build_project.project_id
  location      = "us"
  force_destroy = false

  uniform_bucket_level_access = true
  public_access_prevention    = true
  versioning {
    enabled = true
  }

}

data "google_iam_policy" "tf-state" {
  binding {
    role = "roles/storage.admin"
    members = [
      "serviceaccount:${google_service_account.default.email}"
    ]
  }
}

resource "google_storage_bucket_iam_policy" "tf-state" {
  bucket = google_storage_bucket.state.name
  policy_data = data.google_iam_policy.tf-state.policy_data
}
