resource "azurerm_virtual_network" "vnet1" {
  name                = var.vnet_name
  location            = var.vnet_region
  resource_group_name = azurerm_resource_group.rg.name
  # ***********************************************
  address_space       = var.cidr
  # **********************************************
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
 
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