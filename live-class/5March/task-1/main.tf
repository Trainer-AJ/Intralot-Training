resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  # -----------------------------------
 location = var.location
 # ---------------------------------
  # location = "West Europe"
}
 
 
resource "azurerm_virtual_network" "vnet1" {
  name                = "example-network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  # dns_servers         = ["10.0.0.4", "10.0.0.5"]
 
  subnet {
    name             = "subnet1"
    address_prefixes = ["10.0.1.0/24"]
  }
 
  subnet {
    name             = "subnet2"
    address_prefixes = ["10.0.2.0/24"]
  }
 
  tags = {
    environment = "Production"
  }
}
 
