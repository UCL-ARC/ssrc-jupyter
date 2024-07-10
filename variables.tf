variable "namespace" {
  type = string
  value = "ssrc-ns"
}

variable "network_name" {
  type = string
  value = "ssrc-net"
}

variable "os_disk_gb" {
  type    = string
  default = "50Gi"
}

variable "public_key_openssh" {
  type = string
}

variable "ram_gb" {
  type    = string
  default = "8Gi"
}

variable "vcpu" {
  type    = number
  default = 2
}

variable "vm_count" {
  type    = number
  default = 1
}

variable "vm_prefix" {
  type = string
  value = "jupyter"
}