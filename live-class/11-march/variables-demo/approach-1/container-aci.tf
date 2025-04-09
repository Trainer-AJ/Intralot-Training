resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  # -------------------------------
  # location = "West Europe"

  # USE VARIABLE
  location = var.region
  # -------------------------------
}

