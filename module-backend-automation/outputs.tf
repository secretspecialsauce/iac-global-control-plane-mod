// returns the folder id of the automation folder
output "folder_id" {
  value       = google_folder.backend_automation.name
  description = "folder id of the control plane system"
}