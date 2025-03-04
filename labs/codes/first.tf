# CREATE A RESOURCE GROUP in Azure 

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
  tenant_id = ""
  # application ID here 
  client_id = ""
  # secret value here 
  client_secret = ""
  subscription_id = "392c5720-8008-4cfc-bd2d-c3dff705a66d"
  features {  }
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}