provider "random" {
  # Configuration options
}

resource "random_string" "unique_storage_account_name" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}

resource "azurerm_mssql_server" "example" {
  name                         = "mssqlserver-${random_string.unique_storage_account_name.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.user
  administrator_login_password = var.pswd
  minimum_tls_version          = "1.2"

  tags = {
    environment = "production"
    owner = "aj"
    app_name = "myapp"
  }
}
