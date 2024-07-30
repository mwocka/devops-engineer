resource "google_compute_network" "vpc" {
  name                    = "assessment-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  name          = "public-network"
  ip_cidr_range = var.ist_public_subnet
  network       = google_compute_network.vpc.self_link
  region        = var.region_name
}

resource "google_compute_subnetwork" "private_subnet" {
  name          = "private-network"
  ip_cidr_range = var.ist_private_subnet
  network       = google_compute_network.vpc.self_link
  region        = var.region_name
}
