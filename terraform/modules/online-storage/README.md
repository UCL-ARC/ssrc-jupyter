<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_harvester"></a> [harvester](#requirement\_harvester) | >= 0.6.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_harvester"></a> [harvester](#provider\_harvester) | >= 0.6.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [harvester_cloudinit_secret.server](https://registry.terraform.io/providers/harvester/harvester/latest/docs/resources/cloudinit_secret) | resource |
| [harvester_virtualmachine.server](https://registry.terraform.io/providers/harvester/harvester/latest/docs/resources/virtualmachine) | resource |
| [harvester_volume.mount-disk](https://registry.terraform.io/providers/harvester/harvester/latest/docs/resources/volume) | resource |
| [harvester_image.rhel9](https://registry.terraform.io/providers/harvester/harvester/latest/docs/data-sources/image) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_settings"></a> [disk\_settings](#input\_disk\_settings) | A map of disk settings | `map(string)` | `{}` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace for the storage | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the SSRC network | `string` | n/a | yes |
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | SSH public key | `list(string)` | n/a | yes |
| <a name="input_ssh_username"></a> [ssh\_username](#input\_ssh\_username) | SSH username for the VM | `string` | `"cloud-user"` | no |
| <a name="input_vm_prefix"></a> [vm\_prefix](#input\_vm\_prefix) | Name of the VM | `string` | `"nfs"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_server_ip"></a> [server\_ip](#output\_server\_ip) | IP address to connect to the NFS server |

---
<!-- END_TF_DOCS -->
