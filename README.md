# terraform-azurerm-subnet

Terraform module to create Azure Subnet.

This module doesn't implement `service delegation`.

# Usage

```hcl:examples/basic/main.tf
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.20 |
| azurerm | >= 2.41.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.41.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| address\_prefixes | The address prefixes to use for the subnet. | `list(string)` | `[]` | no |
| enforce\_private\_link\_endpoint\_network\_policies | Enable or Disable network policies for the private link endpoint on the subnet.<br>Conflicts with enforce\_private\_link\_service\_network\_policies. | `bool` | `false` | no |
| enforce\_private\_link\_service\_network\_policies | Enable or Disable network policies for the private link service on the subnet.<br>Conflicts with enforce\_private\_link\_endpoint\_network\_policies. | `bool` | `false` | no |
| name | The name of the subnet.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the subnet.<br>The Resource Group must already exist. | `string` | n/a | yes |
| service\_endpoint\_policy\_ids | The list of IDs of Service Endpoint Policies to associate with the subnet. | `list(string)` | `[]` | no |
| service\_endpoints | The list of Service endpoints to associate with the subnet.<br>Possible values include:<br>* Microsoft.AzureActiveDirectory<br>* Microsoft.AzureCosmosDB<br>* Microsoft.ContainerRegistry<br>* Microsoft.EventHub<br>* Microsoft.KeyVault<br>* Microsoft.ServiceBus<br>* Microsoft.Sql<br>* Microsoft.Storage<br>* Microsoft.Web | `list(string)` | `[]` | no |
| tags | A mapping of tags which should be assigned to Resources. | `map(string)` | `{}` | no |
| virtual\_network\_name | The name of the virtual network to which to attach the subnet.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| address\_prefixes | The address prefixes for the subnet. |
| id | Subnet ID. |
| name | Subnet name. |
| resource\_group\_name | Resource Group name in which the subnet is created in. |
| virtual\_network\_name | The name of the virtual network in which the subnet is created in. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Run tests

```bash
cd test/
go test -v
```

# References

* [Terraform azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
