terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }

    backend "azurerm" {
    resource_group_name   = "terraform-backend-rg"
    storage_account_name  = "tfstatebackend13025"  # Replace with your actual storage account name
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}



provider "azurerm" {
  features {}
}


module "nickname" {
source = "./blob_static_site"
index_document = "content/index.html"
error_404_document = "content/custom_not_found.html"
}

output "url" {
  value = module.nickname.primary_web_host
  
}