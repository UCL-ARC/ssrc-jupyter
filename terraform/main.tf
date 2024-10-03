module "ssrc-jupyter-dept" {
  source = "./modules/jupyter"

  vm_count = 1

  vcpu       = 4
  ram_gb     = "16Gi"
  os_disk_gb = "50Gi"

  vm_prefix = "jupyter-dept"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net-0"

  public_key_openssh = var.public_key_openssh

  z2jupyterhub_version = "3.3.8"

  aad_client_id     = var.aad_client_id
  aad_client_secret = var.aad_client_secret
  aad_tenant_id     = var.aad_tenant_id

  condenser_ingress_isEnabled     = true
  condenser_ingress_test_hostname = "jupyter-dept"
}

module "online-storage-dept" {
  source = "./modules/online-storage"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net-0"
  vm_prefix    = "ssrc-nfs-dept"

  disk_settings = {

  }

  public_key_openssh = var.public_key_openssh
}
