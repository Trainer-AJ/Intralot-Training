terraform {
 required_version = "~> 1.11.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.21"
    }

     random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  }


provider "azurerm" {
  features {}
  alias = "az-cli"
  subscription_id = "21b631a8-0ff6-4c2f-88f3-bc42f8ed2994"
}

provider "azurerm" {
    alias = "hardcoded"

  # Configuration options
  subscription_id = ""
  tenant_id = ""
  client_secret = ""
  client_id = ""
}




