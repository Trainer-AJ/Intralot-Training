## copy and run the code in your terminal:
```sh
mkdir lab4
cd lab4
```

### copy and paste below code :

```sh
code providers.tf
```
1. copy code in `providers.tf`
```tf
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "xxxxxxxx
  tenant_id =  "xxxxxx"
  client_id = "xxxxxx"
  client_secret = "xxxxxx"

}

provider "random" {
  # Configuration options
}
```
```sh
code str.tf
```
now paste the code in str.tf file:
```tf
resource "azurerm_resource_group" "rg2" {
  name     = "after-lunch"
  location = "east us"
  tags = {
    owner = "aj"
    project = "mypro87268"
  }
}

# ********************************************
resource "random_string" "uid" {
  length           = 5
  special          = false
  upper = false
  numeric = true
}
# **************************************************

resource "azurerm_storage_account" "storage_account" {
  resource_group_name = azurerm_resource_group.rg2.name
  location            = azurerm_resource_group.rg2.location
# -------------------- NAME SHOULD BE GLOBALLY UNIQUE ----------------------
  name                     = "terraform${random_string.uid.result}"
# -----------------------------------------------------------------------------

  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
}
```

### run below commands:
```sh
terraform init
terraform plan
terraform apply
```
