variable "project_id" {
  type = string
}

variable "org_id" {
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
  # default = "logName:cloudaudit.googleapis.com/data_access AND NOT protoPayload.serviceName:container.googleapis.com"
}
