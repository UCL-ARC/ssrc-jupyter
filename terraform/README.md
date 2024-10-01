# ssrc-jupyter

![SSRC-Jupyter diagram](../docs/ssrc-jupyter.drawio.svg)

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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.8.5 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.5 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ssrc-jupyter-dept"></a> [ssrc-jupyter-dept](#module\_ssrc-jupyter-dept) | ./modules/jupyter | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | Public SSH key installed on the VM | `list(string)` | n/a | yes |

## Outputs

No outputs.

---
<!-- END_TF_DOCS -->
