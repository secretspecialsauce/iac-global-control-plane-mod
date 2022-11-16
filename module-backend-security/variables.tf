variable "org_id" {
  description = "The id of the organization"
  type        = string
}

// A folder name for all security related projects to be held. Defaults to "security"
variable "backend_security_directory_display_name" {
  default = "security"
  type    = string
}

variable "billing_account_id" {
  type = string
}

// A folder_id of the folder that will contain the security folder
variable "global_control_plane_folder_name" {
  type = string
}

variable "project_prefix" {
  type    = string
  default = ""
}
