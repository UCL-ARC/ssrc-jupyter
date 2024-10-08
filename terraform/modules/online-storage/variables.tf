variable "disk_settings" {
  type        = map(string)
  default     = {}
  description = "A map of disk settings"
}

variable "vm_prefix" {
  type        = string
  default     = "nfs"
  description = "Name of the VM"
}

variable "namespace" {
  type        = string
  description = "Namespace for the storage"
}

variable "network_name" {
  type        = string
  description = "Name of the SSRC network"
}

variable "ssh_username" {
  type        = string
  default     = "cloud-user"
  description = "SSH username for the VM"
}

variable "public_key_openssh" {
  type        = list(string)
  description = "SSH public key"
}
