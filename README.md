# ssrc-jupyter

![SSRC-Jupyter diagram](/docs/ssrc-jupyter.drawio.svg)

## Usage

Terraform Cloud workspace: university-college-london/ARC-SSRC-Condenser/[ssrc-jupyter](https://app.terraform.io/app/university-college-london/workspaces/ssrc-jupyter)

1. Populate the variables in Terraform Cloud
    1. `aad_client_id`, terraform, Provided by the AAD application registration
    2. `aad_client_secret`, terraform, sensitive, Provided by the AAD application
    registration
    3. `aad_tenant_id`, terraform, Provided by the AAD application registration
    4. `public_key_openssh`, terraform, HCL, A list of strings giving the public
    SSH keys to be provided to the VMs in the deployment
    5. `KUBECONFIG_DATA`, environment, sensitive, The base64 encoded kube_config
    data to authenticate with the Harvester cluster

## References

- [K3s](https://docs.k3s.io/installation)
- [Zero to JupyterHub](https://z2jh.jupyter.org/en/stable/)
