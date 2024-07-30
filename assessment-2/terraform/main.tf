terraform {
  required_version = "1.9.3"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.39.0"
    }
  }
}

provider "google" {
  project = var.var_project
}

module "vpc" {
  source                = "./modules/vpc"
  ist_public_subnet     = var.ist_public_subnet
  ist_private_subnet    = var.ist_private_subnet
  region_name           = var.var_region_name
}

module "ist" {
  source                = "./modules/instances"
  subnetwork            = module.vpc.out_private_subnet_name
  instance_names        = ["instance-1", "instance-2", "instance-3"]
  zones                 = ["us-central1-a", "us-central1-b"]
}

module "loadbalancer" {
  source              = "./modules/loadbalancer"
  backend_service_name = "my-backend-service"
  url_map_name         = "my-url-map"
  target_proxy_name   = "my-target-proxy"
  forwarding_rule_name = "my-forwarding-rule"
  backend_instance_groups = module.ist.instance_groups
}

module "gcs" {
  source        = "./modules/gcs"
  bucket_name   = "mateusz-wocka-13123"
  location      = "US"
  project_id    = var.var_project
  versioning_enabled = true
}

module "firewall" {
  source = "./modules/firewall"

  firewall_name = "allow-http-firewall"
  network       = module.vpc.out_vpc_self_link
  source_ranges  = ["0.0.0.0/0"]
  target_tags    = ["http"]
}

module "database" {
  source              = "./modules/database"
  db_instance_name    = "my-db-instance"
  db_version          = "MYSQL_8_0"
  region              = "us-central1"
  db_tier             = "db-f1-micro"
  db_name             = "my_database"
  db_user             = "my_user"
  db_password         = "my_password"
}
