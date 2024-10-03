# jupyter

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.6 |
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | 0.6.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | 0.6.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harvester_cloudinit_secret.cloud-config-jupyter](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/resources/cloudinit_secret) | resource |
| [harvester_virtualmachine.vm](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/resources/virtualmachine) | resource |
| [harvester_image.rhel9](https://registry.terraform.io/providers/harvester/harvester/0.6.4/docs/data-sources/image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aad_client_id"></a> [aad\_client\_id](#input\_aad\_client\_id) | n/a | `string` | n/a | yes |
| <a name="input_aad_client_secret"></a> [aad\_client\_secret](#input\_aad\_client\_secret) | n/a | `string` | n/a | yes |
| <a name="input_aad_tenant_id"></a> [aad\_tenant\_id](#input\_aad\_tenant\_id) | n/a | `string` | n/a | yes |
| <a name="input_calico_version"></a> [calico\_version](#input\_calico\_version) | Version of calico | `string` | n/a | yes |
| <a name="input_condenser_ingress_isEnabled"></a> [condenser\_ingress\_isEnabled](#input\_condenser\_ingress\_isEnabled) | Enable web access to the server | `bool` | n/a | yes |
| <a name="input_condenser_ingress_test_hostname"></a> [condenser\_ingress\_test\_hostname](#input\_condenser\_ingress\_test\_hostname) | Part of the URL for the web application | `string` | n/a | yes |
| <a name="input_k3s_version"></a> [k3s\_version](#input\_k3s\_version) | Version of k3s | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the SSRC namespace | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the SSRC network | `string` | n/a | yes |
| <a name="input_os_disk_gb"></a> [os\_disk\_gb](#input\_os\_disk\_gb) | Size of the VM's primary disk | `string` | n/a | yes |
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | Public SSH key installed on the VM | `list(string)` | n/a | yes |
| <a name="input_ram_gb"></a> [ram\_gb](#input\_ram\_gb) | Amount of memory for the VM | `string` | n/a | yes |
| <a name="input_vcpu"></a> [vcpu](#input\_vcpu) | Number of CPUs for the VM | `number` | n/a | yes |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | Number of instances of the VM | `number` | n/a | yes |
| <a name="input_vm_prefix"></a> [vm\_prefix](#input\_vm\_prefix) | Prefix applied to the server resources | `string` | n/a | yes |
| <a name="input_z2jupyterhub_version"></a> [z2jupyterhub\_version](#input\_z2jupyterhub\_version) | Version of the z2jupyterhub helm chart | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_url"></a> [access\_url](#output\_access\_url) | The URL from which Jupyter can be accessed |

---
<!-- END_TF_DOCS -->
