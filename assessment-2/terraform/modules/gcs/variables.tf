variable "bucket_name" {
  description = "Bucket name"
  type        = string
}

variable "location" {
  description = "Bucket location"
  type        = string
  default     = "US"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "versioning_enabled" {
  description = "Bucket content versioning"
  type        = bool
  default     = false
}
