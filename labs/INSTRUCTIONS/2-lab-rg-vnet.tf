### From the current code of your main.tf file :
copy below part of the code (we will use it later ):
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
  name                = "example-vnet"
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

# get Azure creds
> go to https://labs.xtremelabs.io/Account/LogOn?returnUrl=%2fMyAccount
1. login and launch lab
2. click on cloudexpress and you see azure credentials
### Step 1: Create a Service Principal using Azure Cloud Shell

1. **Open Azure Cloud Shell**:  
   Go to the [Azure Portal](https://portal.azure.com) and click on the **Cloud Shell** icon (usually at the top right). This will open a browser-based terminal for you to interact with Azure.

2. **Run the `az ad sp create-for-rbac` command**:  
   In the Cloud Shell, run the following command to create a service principal with the Contributor role. Replace `your-subscription-id` with your actual Azure Subscription ID.
   ```bash
   az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"
   ```
   Example:
   ```bash
   az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/12345678-1234-1234-1234-123456789abc"
   ```

   This will output a JSON object with details about the Service Principal, including:

   - **appId**: The application ID (Client ID)
   - **displayName**: The display name of the service principal
   - **password**: The secret associated with the service principal (Client Secret)
   - **tenant**: The tenant ID

   Example output:
   ```json
   {
     "appId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
     "displayName": "azure-cli-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
     "password": "xxxxxxxxxxxxxxxxxxxx",
     "tenant": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
   }
   ```

   You will need to keep this information handy for the next steps.

### Step 2: Set Up Terraform to Use the Service Principal

1. **Install Terraform (if not already installed)**:  
   In Azure Cloud Shell, Terraform is already available, so you don’t need to install it. If you're working locally, you’ll need to install Terraform by following the instructions on the [official Terraform website](https://learn.hashicorp.com/tutorials/terraform/install-cli).
```tf
terraform --version
```
- gives no error means you are good
2. **Create a Terraform Configuration File**:  
   You will now use the service principal information to authenticate Terraform with Azure. Create a new directory for your Terraform files and create a new file, `main.tf`:
run below in your `local computer terminal (like powershell)`
   ```bash
   mkdir terraform-azure
   cd terraform-azure
   touch main.tf
   ```

3. **Add the following Terraform configuration** in `main.tf`:

   ```hcl
   provider "azurerm" {
     features {}

     client_id     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  # Replace with your appId
     client_secret = "xxxxxxxxxxxxxxxxxxxx"  # Replace with your password
     tenant_id     = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"  # Replace with your tenant ID
     subscription_id = "your-subscription-id"  # Replace with your Azure subscription ID
   }

   resource "azurerm_resource_group" "example" {
     name     = "example-resources"
     location = "East US"
   }
   ```

   Replace the placeholders:
   - `client_id` with the `appId` from the service principal output.
   - `client_secret` with the `password` from the service principal output.
   - `tenant_id` with the `tenant` from the service principal output.
   - `subscription_id` with your Azure subscription ID.

### run below commands in your local computer terminal (like powershell):
4. **Initialize Terraform**:  
   Run the following command to initialize Terraform and download the required provider plugins:

   ```bash
   terraform init
   ```

5. **Apply the Terraform Configuration**:  
   Run the following command to apply the Terraform configuration, which will create the resource group in Azure:

   ```bash
   terraform apply
   ```

   Terraform will show you a plan of the changes it will make. Type `yes` to proceed.

6. **Check the Resource Group in Azure**:  
   After Terraform completes, go to the Azure Portal, and you should see a new resource group named `example-resources` in the specified region (`East US`).

### Step 3: Optional – Clean Up Resources

Once you are done and no longer need the resource group, you can destroy the resources created by Terraform:

```bash
terraform destroy
```

### Summary of Key Steps

1. **Create the Service Principal** using `az ad sp create-for-rbac`.
2. **Create a Terraform configuration** to use the service principal for authentication.
3. **Initialize Terraform** using `terraform init`.
4. **Create a resource group** using `terraform apply`.
5. Optionally, **clean up resources** with `terraform destroy`.
