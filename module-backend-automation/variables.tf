variable "org_id" {
  description = "The id of the organization"
  type        = string
}

// A folder name for all automation related projects to be held. Defaults to "automation"
variable "backend_automation_directory_display_name" {
  default = "automation"
  type    = string
}

variable "billing_account_id" {
  type = string
}

// A folder_id of the folder that will contain the automation folder
variable "global_control_plane_folder_name" {
  type = string
}

variable "project_prefix" {
  type    = string
  default = ""
}
