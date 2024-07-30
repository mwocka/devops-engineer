variable "subnetwork" {
  description = "Subnetwork"
  type        = string
}

variable "instance_names" {
  description = "List of instance names"
  type    = list(string)
  default = []
}

variable "zones" {
  description = "List of zone names"
  type    = list(string)
  default = []
}
