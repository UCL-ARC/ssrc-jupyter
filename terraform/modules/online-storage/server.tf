locals {
  vm_server_name = "${var.vm_prefix}-server"
}

# Set up the VM
resource "harvester_virtualmachine" "server" {

  name                 = local.vm_server_name
  namespace            = var.namespace
  hostname             = local.vm_server_name
  restart_after_update = true

  description = "A sandbox NFS server"
  tags = {
    app      = var.namespace
    ssh_user = var.ssh_username
  }

  reserved_memory = "100Mi"
  memory          = "4Gi"
  machine_type    = "q35"

  efi = true

  network_interface {
    name           = "nic-1"
    wait_for_lease = true
    type           = "bridge"
    network_name   = var.network_name
  }

  disk {
    name       = "rootdisk"
    type       = "disk"
    size       = "40Gi"
    bus        = "virtio"
    boot_order = 1

    image       = data.harvester_image.rhel9.id
    auto_delete = true
  }

  dynamic "disk" {

    for_each = var.disk_settings

    content {
      name = disk.key
      type = "disk"
      size = disk.value
      bus  = "scsi"

      existing_volume_name = harvester_volume.mount-disk[disk.key].name
      auto_delete          = false
      hot_plug             = true
    }
  }

  cloudinit {
    user_data_secret_name = harvester_cloudinit_secret.server.name
  }

}

resource "harvester_cloudinit_secret" "server" {
  name      = local.vm_server_name
  namespace = var.namespace

  user_data = templatefile(
    "${path.module}/cloud-init-server.yaml",
    {
      public_key_openssh = var.public_key_openssh
    }
  )
  network_data = ""
}
