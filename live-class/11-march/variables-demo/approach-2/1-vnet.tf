variable "cidr_block" {
  description = "The CIDR block that the Virtual Network is using"
  type        = list(string)
  # list can be a collection of values like numbers, strings, or booleans
  default = ["10.0.0.0/16","192.168.0.0/16"]
  
}

resource "azurerm_virtual_network" "first" {
  name                = "example-network"
  location            = azurerm_resource_group.first.location
  resource_group_name = azurerm_resource_group.first.name
  # data type = list 
  address_space       = var.cidr_block
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]

  
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.first.name
  virtual_network_name = azurerm_virtual_network.first.name
  address_prefixes     = ["10.0.1.0/24"]


  }
 