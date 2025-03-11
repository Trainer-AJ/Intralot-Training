###########################################################
# This is just a checklist for terraform to decide 
# if to RUN the code 
# OR
# Exit with error
############################################################
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.21.0"
    }
  }
  # version of terraform required
  required_version = "1.11.0"
}

provider "azurerm" {
  # Configuration options
}

############## Docs link: https://developer.hashicorp.com/terraform/language/expressions/version-constraints#operators
