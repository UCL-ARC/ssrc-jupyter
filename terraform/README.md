# ssrc-jupyter

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.6 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_online-storage-dept"></a> [online-storage-dept](#module\_online-storage-dept) | ./modules/online-storage | n/a |
| <a name="module_ssrc-jupyter-dept"></a> [ssrc-jupyter-dept](#module\_ssrc-jupyter-dept) | ./modules/jupyter | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_client_id"></a> [aad\_client\_id](#input\_aad\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_aad_client_secret"></a> [aad\_client\_secret](#input\_aad\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_aad_tenant_id"></a> [aad\_tenant\_id](#input\_aad\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | Public SSH key installed on the VM | `list(string)` | n/a | yes |

## Outputs

No outputs.

---
<!-- END_TF_DOCS -->
