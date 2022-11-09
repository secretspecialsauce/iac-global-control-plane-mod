variable "org_id" {
    description = "The id of the organization"
    type = "string"
}

variable "backend_network_directory_display_name" {
    default = "network"
    type = "string"
}

variable "billing_account_id" {
  type = string
}