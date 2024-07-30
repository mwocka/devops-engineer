output "ist_pub_address" {
  value = [for instance in google_compute_instance.default : instance.network_interface[0].access_config[0].nat_ip]
}

output "ist_private_address" {
  value = [for instance in google_compute_instance.default : instance.network_interface[0].network_ip]
}

output "instance_groups" {
  value = {
    for ig in google_compute_instance_group.webservers : ig.name => ig.self_link
  }
}