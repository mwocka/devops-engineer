variable "firewall_name" {
  description = "Firewall name"
  type        = string
}

variable "network" {
  description = "Network where firewall will be enable"
  type        = string
}

variable "source_ranges" {
  description = "IP source range"
  type        = list(string)
}

variable "target_tags" {
  description = "Target tags"
  type        = list(string)
}
