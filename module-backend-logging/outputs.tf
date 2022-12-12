// Output the ids of the created resources
output "logging_bucket_id" {
  value = google_storage_bucket.logging_bucket.id
}

output "logging_dataset_id" {
  value = google_bigquery_dataset.logging_dataset.dataset_id
}

output "gcs_logging_sink_id" {
  value = google_logging_organization_sink.bq_org_sink.id
}

output "bq_logging_sink_id" {
  value = google_logging_organization_sink.gcs_org_sink.id
}
