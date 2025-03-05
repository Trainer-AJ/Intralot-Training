terraform {
# required_version = "~> 1.11"
 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.21"
    }
  }
}
 
provider "azurerm" {
  # Configuration options
  features {}
  client_id = "YOUR-VALUES-HERE"
  client_secret = "YOUR-VALUES-HERE"
  tenant_id = "YOUR-VALUES-HERE"
  subscription_id = "YOUR-VALUES-HERE"
}
