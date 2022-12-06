// The folder id of the global-control-plane folder
output "global_control_plane_folder_name" {
  value       = google_folder.global_control_plane.name
  description = "folder id of the control plane system"
}

// The folder id of the edge-workloads folder
output "edge_workloads_folder_name" {
  value       = google_folder.edge_workloads.name
  description = "folder id of the edge workloads folder"
}