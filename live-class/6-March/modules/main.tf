terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.21.1"
    }
  }

}



provider "azurerm" {
  features {}
}


module "nickname" {
  source = "github.com/Trainer-AJ/Intralot-Training/labs/codes/modules-demo//blob_static_site?ref=main"
  
  index_document        = "~/labs/codes/modules-demo/content"
  error_404_document    = "~/content/custom_error.html"
}


output "url" {
  value = module.nickname.primary_web_host
  
}
