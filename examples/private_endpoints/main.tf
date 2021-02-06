provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.2.0"

  name     = "rg-snet-private-endpoints-example"
  location = "North Europe"
}

module "vnet" {
  source  = "bcochofel/virtual-network/azurerm"
  version = "1.1.2"

  resource_group_name = module.rg.name
  name                = "vnet-private-endpoints-example"
  address_space       = ["10.0.0.0/16"]

  depends_on = [module.rg]
}

module "snet" {
  source = "../.."

  name                 = "snet-private-endoints-example"
  resource_group_name  = module.rg.name
  virtual_network_name = module.vnet.name
  address_prefixes     = ["10.0.0.0/24"]

  enforce_private_link_endpoint_network_policies = true
}
