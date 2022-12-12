variable "project_name" {
  type = string
  default = "logging"
}

variable "org_id" {
  type = string
}

variable "billing_account_id" {
  type = string
}

variable "location" {
  type = string
  default = "global"
}

variable "bucket_prefix" {
  type = string
  default = "logging"
}

variable "sink_prefix" {
  type = string
  default = "sink"
}

variable "logs_retention_days" {
  type = number
  default = 365
}

variable "bq_dataset_id" {
  type = string
  default = "logs_dataset"
}

variable "bq_table_expiration_ms" {
  type = number
  default = 3600000
}

variable "log_filter" {
  type = string
  default = ""
  # default = "logName =~ \".*cloudaudit.googleapis.com%2Fsystem_event\""
}


variable "logging_directory_display_name" {
  type = string
  default = "logging"
}