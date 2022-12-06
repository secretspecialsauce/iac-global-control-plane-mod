// returns the folder id of the network folder
output "folder_id" {
  value       = google_folder.backend_network.name
  description = "folder id of the control plane system"
}