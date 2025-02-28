# docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

###########################################
# AIM: Create a resource group in Azure using Terraform
############################################

# ------------ Authenticate to Azure using the Hardcoded values --------------
provider "azurerm" {
  # Configuration options
  features {}
  # alias           = "Dev-Env" 
  # uncomment line 26 to use alias
  client_id       = "xxxxxxxxx"
  client_secret = "xxxxxx"
  tenant_id       = "xxxxx"
  subscription_id = "xxxxxxx"
}

# ------------------ CREATE RG ------------------
resource "azurerm_resource_group" "first" {
  name     = "example"
  location = "West Europe"
}

resource "azurerm_resource_group" "second" {
  # provider = azurerm.Dev-Env
  name     = "UAT-RG-1"
  location = "Central India"
  tags = {
    "Env" = "UAT"
  }
}
