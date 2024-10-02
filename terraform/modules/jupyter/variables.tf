variable "vm_count" {
  type        = number
  description = "Number of instances of the VM"
}

variable "vcpu" {
  type        = number
  description = "Number of CPUs for the VM"
}

variable "ram_gb" {
  type        = string
  description = "Amount of memory for the VM"
}

variable "os_disk_gb" {
  type        = string
  description = "Size of the VM's primary disk"
}

variable "vm_prefix" {
  type        = string
  description = "Prefix applied to the server resources"
}

variable "namespace" {
  type        = string
  description = "Name of the SSRC namespace"
}

variable "network_name" {
  type        = string
  description = "Name of the SSRC network"
}

variable "public_key_openssh" {
  type        = list(string)
  description = "Public SSH key installed on the VM"
}

variable "condenser_ingress_enabled" {
  type        = boolean
  description = "Enable web access to the server"
}

variable "condenser_ingress_test_hostname" {
  type        = string
  description = "Part of the URL for the web application"
}