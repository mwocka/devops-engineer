terraform {
  required_version = "1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.39.0"
    }
  }
}

resource "google_compute_backend_service" "default" {
  name     = var.backend_service_name
  protocol = "HTTP"

  dynamic "backend" {
    for_each = var.backend_instance_groups
    content {
      group = backend.value
    }
  }

  health_checks = [google_compute_http_health_check.default.self_link]

  port_name = "http"
}

resource "google_compute_url_map" "default" {
  name = var.url_map_name

  default_service = google_compute_backend_service.default.self_link
}

resource "google_compute_target_http_proxy" "default" {
  name    = var.target_proxy_name
  url_map = google_compute_url_map.default.self_link
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
  ip_address = google_compute_global_address.default.address
}

resource "google_compute_global_address" "default" {
  name = var.global_ip_name
}

resource "google_compute_http_health_check" "default" {
  name               = "health-check"
  request_path        = "/"
  port                = 80
  check_interval_sec  = 10
  timeout_sec         = 10
  healthy_threshold   = 2
  unhealthy_threshold = 2
}
