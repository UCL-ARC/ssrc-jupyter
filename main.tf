locals {
  prefix     = var.vm_prefix
  cidr       = "/24"
  access_url = ""
}

data "harvester_image" "alma9" {
  display_name = "almalinux-9.4-20240507"
  namespace    = "harvester-public"
}

resource "harvester_cloudinit_secret" "cloud-config-jupyter" {
  name      = "cloud-config-${local.prefix}"
  namespace = var.namespace

  user_data = templatefile("${path.module}/cloud-init.tmpl.yml", {
    public_key_openssh = var.public_key_openssh
  })
}

resource "harvester_virtualmachine" "vm" {

  count = var.vm_count

  name                 = "${local.prefix}${format("%02d", count.index + 1)}"
  namespace            = var.namespace
  restart_after_update = true

  description = "SSRC Jupyter"

  tags = {
    ssh-user = "almalinux"
  }

  cpu    = var.vcpu
  memory = var.ram_gb

  efi         = true
  secure_boot = true

  run_strategy    = "RerunOnFailure"
  hostname        = "${local.prefix}${format("%02d", count.index + 1)}"
  reserved_memory = "100Mi"
  machine_type    = "q35"

  network_interface {
    name           = "nic-1"
    wait_for_lease = true
    type           = "bridge"
    network_name   = var.network_name
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = var.os_disk_gb
    bus        = "virtio"
    boot_order = 1

    image       = data.harvester_image.alma9.id
    auto_delete = true
  }

  cloudinit {
    user_data_secret_name = harvester_cloudinit_secret.cloud-config-jupyter.name
  }
}
