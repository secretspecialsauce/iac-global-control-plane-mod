terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

// Creates the global-control-plane folder which attaches to the root of the organization. All other global control plane modules attach to this folder.
resource "google_folder" "global_control_plane" {
  display_name = var.global_control_plane_directory_display_name
  parent       = "organizations/${var.org_id}"
}

// Creates the edge-workloads folder which attaches to the root of the organization. All region folders attach to this folder.
resource "google_folder" "edge_workloads" {
  display_name = var.edge_workloads_directory_display_name
  parent       = "organizations/${var.org_id}"
}
