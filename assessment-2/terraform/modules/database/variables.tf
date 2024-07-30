variable "db_instance_name" {
  description = "DB instance name"
  type        = string
}

variable "db_version" {
  description = "DB engine"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "db_tier" {
  description = "DB type"
  type        = string
}

variable "db_name" {
  description = "DB name"
  type        = string
}

variable "db_user" {
  description = "DB username"
  type        = string
}

variable "db_password" {
  description = "DB password"
  type       = string
  sensitive   = true
}