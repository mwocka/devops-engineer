variable "backend_instance_groups" {
  description = "Map of backend groups"
  type        = map(string)
}

variable "backend_service_name" {
  description = "Name of the backend service"
  type        = string
  default     = "my-backend-service"
}

variable "url_map_name" {
  description = "Name of the URL map"
  type        = string
  default     = "my-url-map"
}

variable "target_proxy_name" {
  description = "Name of the target HTTP proxy"
  type        = string
  default     = "my-target-proxy"
}

variable "forwarding_rule_name" {
  description = "Name of the global forwarding rule"
  type        = string
  default     = "my-forwarding-rule"
}

variable "global_ip_name" {
  description = "Name of the global IP address"
  type        = string
  default     = "my-global-lb-ip"
}
