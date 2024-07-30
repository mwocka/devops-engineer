output "out_vpc_self_link" {
  value = google_compute_network.vpc.self_link
}

output "out_public_subnet_name" {
  value = google_compute_subnetwork.public_subnet.name
}

output "out_private_subnet_name" {
  value = google_compute_subnetwork.private_subnet.name
}
