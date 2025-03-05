# Link: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config

# ---------- Just to make sure Terraform can access Azure Account  --------
data "azurerm_client_config" "current" {}

# Generate random resource group name
resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = random_pet.rg_name.id
}

# Generate random value for the storage account name
resource "random_string" "unique_storage_account_name" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}

resource "azurerm_storage_account" "storage_account" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  name                     = "terraform${random_string.unique_storage_account_name.result}"

  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "example" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = var.index_document
}

resource "azurerm_storage_blob" "error" {
  name                   = var.error_404_document
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = var.error_404_document
}

resource "azurerm_storage_account_static_website" "test" {
  depends_on         = [azurerm_storage_blob.example]
  storage_account_id = azurerm_storage_account.storage_account.id
  error_404_document = "${var.error_404_document}"
  index_document     = "index.html"
}