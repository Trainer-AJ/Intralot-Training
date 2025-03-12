To create an Azure SQL Server using Terraform with a backend for storing the state, you’ll need to follow these steps. The process involves configuring the Terraform provider, setting up the backend for state management, and creating resources for the Azure SQL Server.

### step 0: launch xtremelabs => take labs => register for MFA => i button => cloud express

### Step 1:
git pull to get latest code

### Step 2:
> **Note:** Either do az login or env NOT both 
```sh
az login
```
or
`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"` then in your local computer terminal put your values and paste below commands....
```sh
# PowerShell
$env:ARM_CLIENT_ID = ""
$env:ARM_CLIENT_SECRET = ""
$env:ARM_TENANT_ID = ""
$env:ARM_SUBSCRIPTION_ID = ""
```

### Step 3: Create a Terraform Configuration Directory
Create a new directory for your Terraform configuration files.

```bash
mkdir terraform-azure-sql
cd terraform-azure-sql
```

### Step 4: Initialize the Terraform Backend Configuration
To configure the Terraform backend (where Terraform will store the state file), you’ll need to use an Azure storage account.

1. **Create an Azure Storage Account (Manually or Using Terraform):**
   - You can create a storage account manually using this [guide](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal)
   --  OR
     - **Directly paste below script in azure cloudshell**:
```sh
      # Set environment variables (replace with your values)
RESOURCE_GROUP="terraform-backend-rg"
STORAGE_ACCOUNT="tfstatebackend$RANDOM"  # Storage account name must be globally unique
CONTAINER_NAME="tfstate"

# Create resource group
az group create --name $RESOURCE_GROUP --location "East US"

# Create storage account
az storage account create --name $STORAGE_ACCOUNT --resource-group $RESOURCE_GROUP --location "East US" --sku Standard_LRS

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT --query '[0].value' -o tsv)

# Create container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT --account-key $ACCOUNT_KEY
```
2. **Configure the Backend in `main.tf`:**

In your project directory, create a file named `main.tf` (this will contain both the backend and resource configurations).

Here’s an example configuration for the backend:
```hcl
terraform {
  backend "azurerm" {
    resource_group_name   = ""
    storage_account_name  = ""
    container_name        = ""
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
      features{}
}

provider "random" {
  # Configuration options
}

variable "user" {
  default = "aj"
}
variable "pswd" {
  default = "nooPho4ae5ooy"
}
resource "random_string" "unique_server_name" {
  length  = 5
  special = false
  upper   = false
  numeric = true
}
resource "azurerm_resource_group" "rg" {
   name = "tf"
   location = "westus"

}
resource "azurerm_mssql_server" "example" {
  name                         = "mssqlserver-${random_string.unique_server_name.result}"
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
```

- Replace `"my-resource-group"`, `"myterraformstate"`, and `"tfstatestorage"` with your own resource group, storage account name, and blob container name, respectively.
- The `key` is the name of the state file (e.g., `terraform.tfstate`).


### Step 7: Initialize Terraform
Before applying any changes, you need to initialize Terraform. Run the following command in your terminal:

```bash
terraform init
```

This command initializes Terraform, sets up the backend configuration, and downloads necessary provider plugins.

### Step 8: Plan the Deployment
Run the following command to generate an execution plan and verify what resources Terraform will create:

```bash
terraform plan
```

### Step 9: Apply the Configuration
Once you’re happy with the plan, apply the configuration to create the Azure SQL Server:

```bash
terraform apply
```

You will be prompted to confirm the action. Type `yes` to proceed.

### Step 10: Verify the Resources in Azure Portal
After Terraform completes, you can log into the [Azure Portal](https://portal.azure.com) to verify that the SQL Server has been created.

### Step 11: (Optional) Manage Other Resources
If you need to create an Azure SQL Database, firewall rules, or other related resources, you can add additional configurations in the `main.tf` file. For example, to create a SQL Database:

```hcl
resource "azurerm_sql_database" "example" {
  name                = "my-sql-database"
  resource_group_name = azurerm_sql_server.example.resource_group_name
  location            = azurerm_sql_server.example.location
  server_name         = azurerm_sql_server.example.name
  sku {
    name     = "S1"
    capacity = 1
  }
}
```
# By the end of the lab : A MS SQL Server should be crated with no tfstate file in your local computer

### Step 12: (Optional) Destroy Resources
If you want to clean up and remove all created resources, you can run the following command:

```bash
terraform destroy
```


