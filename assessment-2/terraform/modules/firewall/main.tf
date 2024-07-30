terraform {
  required_version = "1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.39.0"
    }
  }
}

resource "google_compute_firewall" "allow_http" {
  name    = var.firewall_name
  network = var.network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = var.source_ranges

  target_tags = var.target_tags
}
