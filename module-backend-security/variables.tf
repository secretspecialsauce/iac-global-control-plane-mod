variable "org_id" {
    description = "The id of the organization"
    type = "string"
}

variable "backend_security_directory_display_name" {
    default = "security"
    type = "string"
}

variable "billing_account_id" {
  type = string
}