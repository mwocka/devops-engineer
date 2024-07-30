output "firewall_self_link" {
  value = google_compute_firewall.allow_http.self_link
}