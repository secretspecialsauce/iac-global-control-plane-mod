variable "org_id" {
    description = "The id of the organization"
    type = "string"
}

variable "backend_common_services_directory_display_name" {
    default = "common-services"
    type = "string"
}

variable "billing_account_id" {
  type = string
}