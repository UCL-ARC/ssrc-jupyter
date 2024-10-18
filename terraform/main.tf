module "ssrc-jupyter-dept" {
  source = "./modules/jupyter"

  vm_count = 1

  vcpu       = 4
  ram_gb     = "16Gi"
  os_disk_gb = "100Gi"

  vm_prefix = "jupyter-pilot"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net"

  public_key_openssh = var.public_key_openssh

  z2jupyterhub_version = "3.3.8"        # https://github.com/jupyterhub/zero-to-jupyterhub-k8s/tags
  k3s_version          = "v1.31.1+k3s1" # https://github.com/k3s-io/k3s/releases/
  calico_version       = "v3.28.2"      # https://github.com/projectcalico/calico/releases

  aad_client_id     = var.aad_client_id
  aad_client_secret = var.aad_client_secret
  aad_tenant_id     = var.aad_tenant_id

  condenser_ingress_isEnabled     = true
  condenser_ingress_test_hostname = "jupyter-pilot"
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
