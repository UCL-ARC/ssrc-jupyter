output "jupyter_ip_addr" {
  value       = module.ssrc-jupyter-pilot.ip_addr
  description = "IP Address(es) for the JupyterHub Server VMs"
}

output "jupyter_url" {
  value       = module.ssrc-jupyter-pilot.url
  description = "URL where JupyterHub server can be accessed"
}