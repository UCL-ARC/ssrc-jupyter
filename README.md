# ssrc-jupyter

![SSRC-Jupyter diagram](/docs/ssrc-jupyter.drawio.svg)

## Usage

1. Populate the `public_key_openssh` and `KUBECONFIG` variables
2. Deploy the Terraform module
3. Wait for `cloud-init` to finish configuring k3s on the VM
4. Log into the VM and become root
5. Fill out the `jupyterhub_config.yaml` file with data from a
   suitable AzureAD app registration
6. Run the `install_jupyterhub.sh` script

## References

- [K3s](https://docs.k3s.io/installation)
- [Zero to JupyterHub](https://z2jh.jupyter.org/en/stable/)