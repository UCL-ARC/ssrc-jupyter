# List your outputs here.
output "url" {
  value       = local.access_url
  description = "The URL from which JupyterHub server can be accessed"
}

output "ip_addr" {
  value       = resource.harvester_virtualmachine.vm[*].network_interface[0].ip_address
  description = "The IP address from which JupyterHub server can be administered"
}
