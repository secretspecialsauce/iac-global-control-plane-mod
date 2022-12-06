// returns the folder id of the common services folder
output "folder_id" {
  value       = google_folder.backend_common_services.name
  description = "folder id of the control plane system"
}