variable "var_project" {
  default     = "project-name"
  type        = string
}

variable "var_region_name" {
  default     = "us-central1"
  type        = string
}

variable "ist_private_subnet" {
  default     = "10.26.1.0/24"
  type        = string
}

variable "ist_public_subnet" {
  default     = "10.26.2.0/24"
  type        = string
}