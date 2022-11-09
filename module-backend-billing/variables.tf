variable "org_id" {
    description = "The id of the organization"
    type = "string"
}

variable "backend_billing_directory_display_name" {
    default = "billing"
    type = "string"
}

variable "billing_account_id" {
  type = string
}