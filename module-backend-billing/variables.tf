variable "org_id" {
  description = "The id of the organization"
  type        = string
}

// A folder name for all billing related projects to be held. Defaults to "billing"
variable "backend_billing_directory_display_name" {
  default = "billing"
  type    = string
}

variable "billing_account_id" {
  type = string
}


// A folder_id of the folder that will contain the billing folder
variable "global_control_plane_folder_name" {
  type = string
}

variable "project_prefix" {
  type    = string
  default = ""
}
