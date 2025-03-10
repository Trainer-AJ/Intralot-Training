### From the current code of your main.tf file :
copy below part FROM `YOUR CODE` DO NOT COPY below code (we will use it later ):
```tf
provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "xxxxxxxxxxxxxxxx"
  tenant_id =  "xxxxxxxxxxxxxxxxx"
  client_id = "xxxxxxxxxxxxxxxxxxx"
  client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxx"

}
```

### paste below code in main.tf:
```tf
# ============================================================
# Configure the Azure provider  and set the version

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.22.0"
    }
  }
}

# ------------------- DON"T FORGET TO PROVIDE YOUR VALUES -------------------------
provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "xxxxxxxxxxxxxxxx"
  tenant_id =  "xxxxxxxxxxxxxxxxx"
  client_id = "xxxxxxxxxxxxxxxxxxx"
  client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxx"

}
# ============================================================

# Create a resource group
/*
resource "mysql_server" "srv1" {
    username = "mysqladmin"
    password = "P@ssw0rd1234!"
  
}

resource "mysql_server" "srv2" {
    username = "aj_trainer"
    password = "nooPho4ae5ooyai2"
  
}
*/

resource "azurerm_resource_group" "rg1" {
  name     = "example"
  location = "West Europe"
  tags = {
    owner = "aj"
    project = "mypro87268"
  }
}

resource "azurerm_resource_group" "rg2" {
  name     = "prod-rg"
  location = "east us"
  tags = {
    owner = "aj"
    project = "mypro87268"
  }
}


# ----------------- AIM: Create a virtual network in the same REGION like above  -----------------


resource "azurerm_virtual_network" "vnet1" {
  name                = "terraform-vnet"
  address_space       = ["10.0.0.0/16"]
#   location            = "West Europe"
location = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
}

```

### don't forget to provide `Azure Credentials in new code`

### in your Terminal (in VS CODE press ctrl then J) ... run below commands:
```
terraform plan 
```

```sh
terraform apply --auto-approve
```

## check in azure portal: YOu can see two resource groups and a virtual network inside `example` resource group
