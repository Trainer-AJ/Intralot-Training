terraform {
# required_version = "~> 1.11.0"
 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.21"
    }
  }
  backend "azurerm" {
    resource_group_name   = "example-resources"
    storage_account_name  = "terraformstfstatehere"
    container_name        = "ath"
    # name of the file to be uploaded in the container
    key                   = "local-comp-code1.tfstate"
    
  }
}
 
provider "azurerm" {
  # Configuration options
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "backend-demo-tf-resources"
  # -----------------------------------
 location = "East US"
 # ---------------------------------
  # location = "West Europe"
}
