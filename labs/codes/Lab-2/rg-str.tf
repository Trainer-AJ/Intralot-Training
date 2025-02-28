# AIM: Create a Storage account after creating a Resource Group
# docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
}

# Create a resource group
resource "azurerm_resource_group" "example2" {
  name     = "resourcegroupname"
  location = "East US"
}

# Create a storge account
resource "azurerm_storage_account" "example" {
  name                     = "your-name-todays-date-all-in-small-letters-without-space"
  # resource_group_name      = "resourcegroupname"
  resource_group_name = azurerm_resource_group.example2.name
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
