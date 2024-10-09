# ssrc-jupyter

![SSRC-Jupyter diagram](/docs/ssrc-jupyter.drawio.svg)

> [!IMPORTANT]
> The JupyterHub servers managed by this deployment should be considered at-risk.
> This means that no user data is backed up. User data will be lost when the VM
> running the server is redeployed or destroyed.

## Deploy

Terraform Cloud workspace: university-college-london/ARC-SSRC-Condenser/[ssrc-jupyter](https://app.terraform.io/app/university-college-london/workspaces/ssrc-jupyter)

1. Populate the variables in Terraform Cloud
    - `aad_client_id`, terraform, Provided by the AAD application registration
    - `aad_client_secret`, terraform, sensitive, Provided by the AAD application
    registration
    - `aad_tenant_id`, terraform, Provided by the AAD application registration
    - `public_key_openssh`, terraform, HCL, A list of strings giving the public
    SSH keys to be provided to the VMs in the deployment
    - `KUBECONFIG_DATA`, environment, sensitive, The base64 encoded kube_config
    data to authenticate with the Harvester cluster
2. Plan and Apply changes through Terraform Cloud

## Usage

This module includes two sub-modules: [jupyter](/terraform/modules/jupyter/) and
[online-storage](/terraform/modules/online-storage/). The jupyter module specifies
a VM deployment and runs scripts to install and run a JupyterHub server. Web ingress
is enabled automatically. The online-storage module provides storage to the server
via NFS.

### Create a new JupyterHub server

Create a new branch. Add a module block to `/terraform/main.tf` as follows:

``` terraform
module "ssrc-jupyter-dept" {   # REPLACE dept
  source = "./modules/jupyter"

  vm_count = 1

  vcpu       = 4      # MODIFY VM CPU, RAM, and STORAGE
  ram_gb     = "16Gi"
  os_disk_gb = "50Gi"

  vm_prefix = "jupyter-dept"    # REPLACE dept

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
  condenser_ingress_test_hostname = "jupyter-dept"    # REPLACE dept
}
```

In the above example, replace `dept` with an appropriate name for the server where
indicated. You may also modify the VM's compute resources as indicated.

Commit this change to the new branch, then create a PR. After the PR has been merged,
approve the corresponding Apply in the Terraform Cloud workspace. After about 5
minutes the server will be available at `https://jupyter-dept.ssrc.condenser.arc.ucl.ac.uk`.

Access to the server is controlled by the Azure AD application.

### Administer a deployed JupyterHub server

You can directly administer a deployed JupyterHub server. Any changes you make to the configuration on the VM will not be recorded in the deployment; they will be wiped out if the VM is redeployed.

## References

- [K3s](https://docs.k3s.io/installation)
- [Zero to JupyterHub](https://z2jh.jupyter.org/en/stable/)
