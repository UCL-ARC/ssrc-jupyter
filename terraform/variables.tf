variable "public_key_openssh" {
  type        = list(string)
  description = "Public SSH key installed on the VMs. Managed in TFC"
}

variable "aad_client_id" {
  type        = string
  description = "Managed in TFC"
}

variable "aad_client_secret" {
  type        = string
  sensitive   = true
  description = "Managed in TFC"
}

variable "aad_tenant_id" {
  type        = string
  description = "Managed in TFC"
}
