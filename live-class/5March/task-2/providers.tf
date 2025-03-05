# ----------------------------------------------------
# LAB: 1 SetUp Terraform 
# AUTHOR: Ananay Ojha
# ---------------------------------------------------
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 4.21"
    }
  }
  # required_version = "~> 1.11.0"
}

# AFter AZ Login command, Create a service Principal In Azure Using below Command
# az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"

provider "azurerm" {
  # Configuration options
  features {}
  alias           = "azure-pass"
  client_id = "YOUR-VALUES-HERE"
  client_secret = "YOUR-VALUES-HERE"
  tenant_id = "YOUR-VALUES-HERE"
  subscription_id = "YOUR-VALUES-HERE"
}
