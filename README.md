# terraform-azurerm-subnet

Terraform module to create Azure Subnet.

This module doesn't implement `service delegation`.
This module also validates the name according to the Azure Resource naming restrictions.

## Usage

```hcl
provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.6.0"

  name     = "rg-snet-basic-example"
  location = "North Europe"
}

module "vnet" {
  source  = "bcochofel/virtual-network/azurerm"
  version = "1.3.0"

  resource_group_name = module.rg.name
  name                = "vnet-basic-example"
  address_space       = ["10.0.0.0/16"]

  depends_on = [module.rg]
}

module "snet" {
  source = "../.."

  name                 = "snet-basic-example"
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.106.1, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.106.1, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_subnet.snet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.snetnsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The address prefixes to use for the subnet. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the subnet.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | Network Security Group name. | `string` | n/a | yes |
| <a name="input_resource_group_location"></a> [resource\_group\_location](#input\_resource\_group\_location) | The location of the resource group in which to create the subnet.<br>The Resource Group must already exist. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the subnet.<br>The Resource Group must already exist. | `string` | n/a | yes |
| <a name="input_service_endpoint_policy_ids"></a> [service\_endpoint\_policy\_ids](#input\_service\_endpoint\_policy\_ids) | The list of IDs of Service Endpoint Policies to associate with the subnet. | `list(string)` | `null` | no |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | The list of Service endpoints to associate with the subnet.<br>Possible values include:<br>* Microsoft.AzureActiveDirectory<br>* Microsoft.AzureCosmosDB<br>* Microsoft.ContainerRegistry<br>* Microsoft.EventHub<br>* Microsoft.KeyVault<br>* Microsoft.ServiceBus<br>* Microsoft.Sql<br>* Microsoft.Storage<br>* Microsoft.Web | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to Resources. | `map(string)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network to which to attach the subnet.<br>Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_address_prefixes"></a> [address\_prefixes](#output\_address\_prefixes) | The address prefixes for the subnet. |
| <a name="output_id"></a> [id](#output\_id) | Subnet ID. |
| <a name="output_name"></a> [name](#output\_name) | Subnet name. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group name in which the subnet is created in. |
| <a name="output_virtual_network_name"></a> [virtual\_network\_name](#output\_virtual\_network\_name) | The name of the virtual network in which the subnet is created in. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing

This repository uses semantic versioning and conventional commits. Some automation need this to work correctly.
There are 2 GitHub Workflows:

- lint.yml: runs on Pull Request to validate Terraform
- release.yml: runs on merge to the default branch. This workflow generates a Changelog file and creates a GitHub release based on the conventional commit messages.

## Run tests

```bash
cd test/
go test -v
```

## pre-commit hooks

This repository uses [pre-commit](https://pre-commit.com/).

To install execute:

```bash
pre-commit install
pre-commit install --install-hooks -t commit-msg
```

To run the hooks you need to install:

* [terraform](https://github.com/hashicorp/terraform)
* [terraform-docs](https://github.com/terraform-docs/terraform-docs)
* [TFLint](https://github.com/terraform-linters/tflint)
* [TFSec](https://github.com/tfsec/tfsec)
* [checkov](https://github.com/bridgecrewio/checkov)
* [goimports](https://pkg.go.dev/golang.org/x/tools/cmd/goimports)
* [golint](https://pkg.go.dev/golang.org/x/lint/golint)

## References

* [Azure Resource naming restrictions](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules)
* [Terraform azurerm_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet)
