module "jupyter-dev" {
  source = "./modules/jupyter"

  vm_count = 1

  vcpu       = 2
  ram_gb     = "8Gi"
  os_disk_gb = "50Gi"

  vm_prefix = "jupyter-dev"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net"

  public_key_openssh = var.public_key_openssh

  # renovate: datasource=github-releases depName=jupyterhub/zero-to-jupyterhub-k8s versioning=loose
  z2jupyterhub_version = "3.3.8" # https://github.com/jupyterhub/zero-to-jupyterhub-k8s/tags
  # renovate: datasource=github-releases depName=k3s-io/k3s versioning=loose
  k3s_version = "v1.31.1+k3s1" # https://github.com/k3s-io/k3s/releases/
  # renovate: datasource=github-releases depName=projectcalico/calico versioning=loose
  calico_version = "v3.28.2" # https://github.com/projectcalico/calico/releases

  aad_client_id     = var.aad_client_id
  aad_client_secret = var.aad_client_secret
  aad_tenant_id     = var.aad_tenant_id

  jupyter_image = "jupyter/datascience-notebook"
  # renovate: datasource=docker depName=jupyter/datascience-notebook versioning=loose
  jupyter_image_version = "x86_64-ubuntu-22.04"

  condenser_ingress_isEnabled     = true
  condenser_ingress_dev_hostname = "jupyter-dev"
}

module "online-storage-dev" {
  source = "./modules/online-storage"

  namespace    = "ssrc-ns"
  network_name = "ssrc-net"
  vm_prefix    = "jupyter-dev-storage"

  disk_settings = {
    mountdisk1 = "10Gi"
  }

  public_key_openssh = var.public_key_openssh
}
