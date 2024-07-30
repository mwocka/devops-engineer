output "bucket_name" {
  description = "The name of the GCS bucket"
  value       = google_storage_bucket.bucket.name
}

output "bucket_location" {
  description = "The location of the GCS bucket"
  value       = google_storage_bucket.bucket.location
}