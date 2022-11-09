// returns the folder id of the security folder
output "folder_id" {
  value       = google_folder.backend_security.name
  description = "folder id of the control plane system"
}