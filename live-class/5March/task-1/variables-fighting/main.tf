resource "azurerm_resource_group" "rg" {
  name     = var.rg-name
  # -----------------------------------
 location = "West Europe"
}
