# SSRC Jupyter Instance

![SSRC-Jupyter diagram](docs/ssrc-jupyter.drawio.svg)

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
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.8.5 |
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
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Name of the SSRC namespace | `string` | `"ssrc-ns"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the SSRC network | `string` | `"ssrc-net"` | no |
| <a name="input_os_disk_gb"></a> [os\_disk\_gb](#input\_os\_disk\_gb) | Size of the VM's primary disk | `string` | `"50Gi"` | no |
| <a name="input_public_key_openssh"></a> [public\_key\_openssh](#input\_public\_key\_openssh) | Public SSH key installed on the VM | `string` | n/a | yes |
| <a name="input_ram_gb"></a> [ram\_gb](#input\_ram\_gb) | Amount of memory for the VM | `string` | `"8Gi"` | no |
| <a name="input_vcpu"></a> [vcpu](#input\_vcpu) | Number of CPUs for the VM | `number` | `2` | no |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | Number of instances of the VM | `number` | `1` | no |
| <a name="input_vm_prefix"></a> [vm\_prefix](#input\_vm\_prefix) | Prefix applied to the VM | `string` | `"ssrc-jupyter"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_url"></a> [access\_url](#output\_access\_url) | The URL from which Jupyter can be accessed |

---
<!-- END_TF_DOCS -->
