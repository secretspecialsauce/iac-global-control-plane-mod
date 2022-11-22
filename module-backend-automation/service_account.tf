resource "google_service_account" "default" {
  account_id   = "gcb-repo-iac-deploy"
  display_name = "Used by Google Cloud Build for Terraform deployments on repo iac-deploy; Terraform managed"
}

resource "google_organization_iam_member" "default" {
  for_each = toset(local.gcb-tf-iam-roles)

  org_id = var.org_id
  role   = each.value
  member = "serviceAccount:${google_service_account.default.email}"
}
