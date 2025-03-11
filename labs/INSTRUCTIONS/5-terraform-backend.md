To create an Azure SQL Server using Terraform with a backend for storing the state, you’ll need to follow these steps. The process involves configuring the Terraform provider, setting up the backend for state management, and creating resources for the Azure SQL Server.

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
    resource_group_name   = "my-resource-group"
    storage_account_name  = "myterraformstate"
    container_name        = "tfstatestorage"
    key                   = "terraform.tfstate"
  }
}
```

- Replace `"my-resource-group"`, `"myterraformstate"`, and `"tfstatestorage"` with your own resource group, storage account name, and blob container name, respectively.
- The `key` is the name of the state file (e.g., `terraform.tfstate`).

### Step 5: Configure the Azure Provider
In the same `main.tf` file, configure the Azure provider:

```hcl
provider "azurerm" {
  features {}
}
```

### Step 6: Define the Azure SQL Server Resource
Now, add the Azure SQL Server resource in the `main.tf` file.

```hcl
resource "azurerm_sql_server" "example" {
  # Define the name of the SQL Server
  name                         = "my-sql-server"
  resource_group_name          = "my-resource-group"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234"  # Change to a secure password
}
```

- Replace the SQL server name (`my-sql-server`), resource group name, and location with your desired values.
- Choose a secure password for the `administrator_login_password`.

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

### Step 12: (Optional) Destroy Resources
If you want to clean up and remove all created resources, you can run the following command:

```bash
terraform destroy
```

### Summary of Files:
- **main.tf** – Contains both the backend configuration, provider configuration, and the resources.

```hcl
terraform {
  backend "azurerm" {
    resource_group_name   = "my-resource-group"
    storage_account_name  = "myterraformstate"
    container_name        = "tfstatestorage"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_sql_server" "example" {
  name                         = "my-sql-server"
  resource_group_name          = "my-resource-group"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssw0rd1234"
}
```

---

Let me know if you need any help or further clarification!
