output "server_ip" {
  value       = harvester_virtualmachine.server.network_interface[0].ip_address
  description = "IP address to connect to the NFS server"
}
