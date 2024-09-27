module "ssrc-jupyter-dept" {
  source = "./modules/jupyter"

  vm_count = 1

  vcpu       = 4
  ram_gb     = "16Gi"
  os_disk_gb = "50Gi"

  vm_prefix = "ssrc-jupyter-dept"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net"

  public_key_openssh = var.public_key_openssh
}

module "online-storage-dept" {
  source = "./modules/online-storage"

  namespace = "ssrc-ns"
  vm_prefix = "ssrc-nfs-dept"
  image_id  = data.harvester_image.rhel9.id

  disk_settings = {

  }

  public_key_openssh = var.public_key_openssh
}