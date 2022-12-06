variable "org_id" {
  description = "The id of the organization"
  type        = string
}

// The display name of the global-control-plane folder. Defaults to "global-control-plane"
variable "global_control_plane_directory_display_name" {
  default = "global-control-plane"
  type    = string
}

// The display name of the edge-workloads folder. Defaults to "edge-workloads"
variable "edge_workloads_directory_display_name" {
  default = "edge-workloads"
  type    = string
}
