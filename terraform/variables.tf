variable "public_key_openssh" {
  type        = list(string)
  description = "Public SSH key installed on the VM"
}

variable "aad_client_id" {
  type = string
}

variable "aad_client_secret" {
  type      = string
  sensitive = true
}

variable "aad_tenant_id" {
  type = string
}