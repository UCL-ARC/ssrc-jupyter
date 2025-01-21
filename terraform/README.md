# ssrc-jupyter

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.8 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_jupyter-dev"></a> [jupyter-dev](#module\_jupyter-dev) | ./modules/jupyter | n/a |
| <a name="module_online-storage-pilot"></a> [online-storage-pilot](#module\_online-storage-pilot) | ./modules/online-storage | n/a |
| <a name="module_ssrc-jupyter-pilot"></a> [ssrc-jupyter-pilot](#module\_ssrc-jupyter-pilot) | ./modules/jupyter | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_client_id"></a> [aad\_client\_id](#input\_aad\_client\_id) | Managed in TFC | `string` | n/a | yes |
| <a name="input_aad_client_secret"></a> [aad\_client\_secret](#input\_aad\_client\_secret) | Managed in TFC | `string` | n/a | yes |
| <a name="input_aad_tenant_id"></a> [aad\_tenant\_id](#input\_aad\_tenant\_id) | Managed in TFC | `string` | n/a | yes |
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | Public SSH key installed on the VMs. Managed in TFC | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_jupyter_ip_addr"></a> [jupyter\_ip\_addr](#output\_jupyter\_ip\_addr) | IP Address(es) for the JupyterHub Server VMs |
| <a name="output_jupyter_url"></a> [jupyter\_url](#output\_jupyter\_url) | URL where JupyterHub server can be accessed |

---
<!-- END_TF_DOCS -->
