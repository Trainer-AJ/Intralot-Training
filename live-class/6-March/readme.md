### RUN Below commands in Azure CLoudshell to auto create storage account

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

### Replace the values with your values in backend.tf

### authenticate terraform 
```sh
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"
```
OR 
use `az login ` 
OR
```sh
$env:ARM_CLIENT_ID = "00000000-0000-0000-0000-000000000000"
$env:ARM_CLIENT_SECRET = "12345678-0000-0000-0000-000000000000"
$env:ARM_TENANT_ID = "10000000-0000-0000-0000-000000000000"
$env:ARM_SUBSCRIPTION_ID = "20000000-0000-0000-0000-000000000000"
```

### run terraform init then apply
