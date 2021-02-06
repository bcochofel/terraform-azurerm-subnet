variable "tags" {
  description = "A mapping of tags which should be assigned to Resources."
  type        = map(string)
  default     = {}
}

variable "name" {
  description = <<EOT
The name of the subnet.
Changing this forces a new resource to be created.
EOT
  type        = string
}

variable "resource_group_name" {
  description = <<EOT
The name of the resource group in which to create the subnet.
The Resource Group must already exist.
EOT
  type        = string
}

variable "virtual_network_name" {
  description = <<EOT
The name of the virtual network to which to attach the subnet.
Changing this forces a new resource to be created.
EOT
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
  default     = []
}

variable "enforce_private_link_endpoint_network_policies" {
  description = <<EOT
Enable or Disable network policies for the private link endpoint on the subnet.
Conflicts with enforce_private_link_service_network_policies.
EOT
  type        = bool
  default     = false
}

variable "enforce_private_link_service_network_policies" {
  description = <<EOT
Enable or Disable network policies for the private link service on the subnet.
Conflicts with enforce_private_link_endpoint_network_policies.
EOT
  type        = bool
  default     = false
}

variable "service_endpoints" {
  description = <<EOT
The list of Service endpoints to associate with the subnet.
Possible values include:
* Microsoft.AzureActiveDirectory
* Microsoft.AzureCosmosDB
* Microsoft.ContainerRegistry
* Microsoft.EventHub
* Microsoft.KeyVault
* Microsoft.ServiceBus
* Microsoft.Sql
* Microsoft.Storage
* Microsoft.Web
EOT
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = []
}
