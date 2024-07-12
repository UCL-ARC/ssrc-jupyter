variable "namespace" {
  type        = string
  default     = "ssrc-ns"
  description = "Name of the SSRC namespace"
}

variable "network_name" {
  type        = string
  default     = "ssrc-net"
  description = "Name of the SSRC network"
}

variable "os_disk_gb" {
  type        = string
  default     = "50Gi"
  description = "Size of the VM's primary disk"
}

variable "public_key_openssh" {
  type        = string
  description = "Public SSH key installed on the VM"
}

variable "ram_gb" {
  type        = string
  default     = "16Gi"
  description = "Amount of memory for the VM"
}

variable "vcpu" {
  type        = number
  default     = 4
  description = "Number of CPUs for the VM"
}

variable "vm_count" {
  type        = number
  default     = 1
  description = "Number of instances of the VM"
}

variable "vm_prefix" {
  type        = string
  default     = "ssrc-jupyter"
  description = "Prefix applied to the VM"
}
