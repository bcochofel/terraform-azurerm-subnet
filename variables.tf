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

  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 80 && can(regex("^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$", var.name))
    error_message = "Invalid name (check Azure Resource naming restrictions for more info)."
  }
}

variable "resource_group_name" {
  description = <<EOT
The name of the resource group in which to create the subnet.
The Resource Group must already exist.
EOT
  type        = string
}

variable "resource_group_location" {
  description = <<EOT
The location of the resource group in which to create the subnet.
The Resource Group must already exist.
EOT
  type        = string
}

variable "nsg_name" {
  description = <<EOT
Network Security Group name.
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
  default     = null
}
