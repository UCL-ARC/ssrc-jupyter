# List your outputs here.
output "access_url" {
  value       = local.access_url
  description = "The URL from which Jupyter can be accessed"
}

output "ip_address" {
  value       = resource.harvester_virtualmachine.vm.network_interface[0].ip_address
  description = "The server's IP address"
}