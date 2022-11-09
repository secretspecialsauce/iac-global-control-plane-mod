// returns the folder id of the billing folder
output "folder_id" {
  value       = google_folder.backend_billing.name
  description = "folder id of the control plane system"
}