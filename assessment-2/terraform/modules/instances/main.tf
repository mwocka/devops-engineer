terraform {
  required_version = "1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.39.0"
    }
  }
}

resource "google_compute_instance" "default" {
  count        = length(var.instance_names)
  name         = element(var.instance_names, count.index)
  machine_type = "e2-micro"
  zone         = element(var.zones, count.index % length(var.zones))
  tags         = ["ssh", "http"]

  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20210720"
    }
  }

  labels = {
    webserver = "true"
  }

  metadata = {
    startup-script = <<SCRIPT
      #!/bin/bash
      apt-get update
      apt-get install -y nginx
      service nginx start
      SCRIPT
  }

  network_interface {
    subnetwork = var.subnetwork
    access_config {
      // Ephemeral IP
    }
  }
  allow_stopping_for_update = true
}

resource "google_compute_instance_group" "webservers" {
  for_each = toset(var.zones)

  name        = "webservers-${each.value}"
  description = "Sample description for ${each.value}"

  instances = [
    for inst in google_compute_instance.default :
    inst.id if inst.zone == each.value
  ]

  named_port {
    name = "http"
    port = 80
  }

  zone = each.value
}
