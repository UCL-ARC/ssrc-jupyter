module "ssrc-jupyter-dept" {
  source = "./modules/jupyter"

  vm_count = 1

  vcpu       = 4
  ram_gb     = "16Gi"
  os_disk_gb = "50Gi"

  vm_prefix = "ssrc-jupyter-dept"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net-0"

  public_key_openssh = var.public_key_openssh
}

module "online-storage-dept" {
  source = "./modules/online-storage"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net"
  vm_prefix    = "ssrc-nfs-dept"

  disk_settings = {

  }

  public_key_openssh = var.public_key_openssh
}
