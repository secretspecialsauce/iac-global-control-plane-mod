variable "org_id" {
  description = "The id of the organization"
  type        = string
}

// A folder name for all common services related projects to be held. Defaults to "common-services"
variable "backend_common_services_directory_display_name" {
  default = "common-services"
  type    = string
}

variable "billing_account_id" {
  type = string
}

// A folder_id of the folder that will contain the common-services folder
variable "global_control_plane_folder_name" {
  type = string
}

variable "project_prefix" {
  type    = string
  default = ""
}
