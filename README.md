# ssrc-jupyter

![SSRC-Jupyter diagram](/docs/ssrc-jupyter.drawio.svg)

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

Add a module block to `/terraform/main.tf` as follows:

## References

- [K3s](https://docs.k3s.io/installation)
- [Zero to JupyterHub](https://z2jh.jupyter.org/en/stable/)
