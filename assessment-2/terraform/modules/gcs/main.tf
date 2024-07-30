terraform {
  required_version = "1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.39.0"
    }
  }
}

resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  project  = var.project_id

  versioning {
    enabled = var.versioning_enabled
  }

  lifecycle {
    prevent_destroy = false
  }
  force_destroy = true
}

resource "google_storage_bucket_object" "default" {
 name         = "sample_website.html"
 source       = "../static-webpage/sample_website.html"
 content_type = "text/plain"
 bucket       = google_storage_bucket.bucket.id
}
