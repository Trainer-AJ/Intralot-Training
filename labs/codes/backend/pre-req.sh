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
