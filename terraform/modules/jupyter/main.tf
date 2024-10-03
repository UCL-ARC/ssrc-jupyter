locals {
  prefix     = var.vm_prefix
  access_url = "${var.vm_prefix}.ucl-arc.dev/"
}

data "harvester_image" "rhel9" {
  display_name = "almalinux-9.4-20240507"
  namespace    = "harvester-public"
}

resource "harvester_cloudinit_secret" "cloud-config-jupyter" {
  name      = "cloud-config-${local.prefix}"
  namespace = var.namespace

  user_data = templatefile("${path.module}/cloud-init.tmpl.yml", {
    public_key_openssh = var.public_key_openssh
    install_k3s_script = indent(6, templatefile(
      "${path.module}/install_k3s.sh",
      {
        k3s_version = var.k3s_version
      }
      ))
    jupyterhub_config = indent(6, templatefile(
      "${path.module}/jupyterhub_config.yaml",
      {
        hostname          = var.vm_prefix
        aad_client_id     = var.aad_client_id
        aad_client_secret = var.aad_client_secret
        aad_tenant_id     = var.aad_tenant_id
      }
      )
    )
    install_jupyterhub_script = indent(6, templatefile(
      "${path.module}/install_jupyterhub.sh",
      {
        z2jupyterhub_version = var.z2jupyterhub_version
        calico_version = var.calico_version
      }
    ))
  })
}

resource "harvester_virtualmachine" "vm" {

  count = var.vm_count

  name                 = "${local.prefix}${format("%02d", count.index + 1)}"
  namespace            = var.namespace
  restart_after_update = true

  description = "SSRC Jupyter"

  tags = {
    ssh-user                        = "almalinux"
    condenser_ingress_isEnabled     = var.condenser_ingress_isEnabled
    condenser_ingress_test_hostname = var.condenser_ingress_test_hostname
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

    image       = data.harvester_image.rhel9.id
    auto_delete = true
  }

  cloudinit {
    user_data_secret_name = harvester_cloudinit_secret.cloud-config-jupyter.name
  }

  lifecycle {
    replace_triggered_by = [
      harvester_cloudinit_secret.cloud-config-jupyter.user_data
    ]
  }
}
