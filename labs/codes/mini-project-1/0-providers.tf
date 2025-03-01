terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.7.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "azurerm" {
  features {}
}
