terraform {
# required_version = "~> 1.11.0"
 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.21"
    }
  }
  backend "azurerm" {
    resource_group_name   = "tf-backend"
    storage_account_name  = "backendhere9083"
    container_name        = "lower-env-state-here"
    # name of the file to be uploaded in the container
    key                   = "mssql.tfstate"
    # subscription_id = "value"
    
  }
}