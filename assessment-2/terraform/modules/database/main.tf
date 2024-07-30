terraform {
  required_version = "1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.39.0"
    }
  }
}

resource "google_sql_database_instance" "default" {
  name             = var.db_instance_name
  database_version = var.db_version
  region           = var.region

  settings {
    tier = var.db_tier

    ip_configuration {
      authorized_networks {
        name = "public"
        value = "0.0.0.0/0"
      }
      ipv4_enabled = true
    }
  }
  deletion_protection=false
}

resource "google_sql_database" "default" {
  name     = var.db_name
  instance = google_sql_database_instance.default.name
  charset  = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "default" {
  name     = var.db_user
  instance = google_sql_database_instance.default.name
  password = var.db_password
}
