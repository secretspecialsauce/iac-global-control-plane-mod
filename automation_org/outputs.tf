// returns the folder id of the automation folder
output "folder_id" {
  value       = google_folder.backend_automation.name
  description = "folder id of the control plane system"
}

output "gcb-project" {
  value = module.backend_cloud_build_project
}

output "gcb_tf_sa" {
  value = google_service_account.default
}

output "gcb_tf_iam_roles" {
  value = google_organization_iam_member.default
}
