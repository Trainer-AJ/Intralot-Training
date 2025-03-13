## AIM: To run Terraform code in an Azure DevOps YAML pipeline using the Terraform extension, follow these steps:

### Step 1: Set Up Azure DevOps Environment

1. **Create an Azure DevOps Project**: If you don’t already have one, create a new project in Azure DevOps.
   
2. **Install Terraform Extension**:
   - Go to the ORGANIZATION SETTINGS ==> left side ==>  **extentions**  ==>**on top right side** ==> browse marketplace and search for the **Terraform extension**.
   - Install the **Terraform** extension to your Azure DevOps organization. This extension will provide the necessary tasks for working with Terraform.
   - it will open in new tab.... **once installed get back azure pipleines browser tab**
3. **Service Connection to Azure** if NOT DONE ALREADY:
   - In Azure DevOps, go to your project settings.
   - Under **Service connections**, create a new **Azure Resource Manager** service connection. This connection will be used by Terraform to authenticate and interact with Azure resources.

   -
### create a storage account -- run this is azure cloudshell
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
### GO and check storage account name in azure portal ==> note it down 

### Step 2: Create the YAML Pipeline

1. **Go to Pipelines** in Azure DevOps and create a new pipeline.
2. Choose **YAML** for the pipeline configuration.
3. Add the following sample YAML code to define the Terraform pipeline. This example assumes you're using the **Terraform Extension** in Azure DevOps.

### Example Pipeline YAML
- go to left side pipeline option
- click on `New Pipeline` the blue button on top right side
- choose first option => azure repos git 
- click on `starter pipleine


```yml
trigger:
- main

pool:
  vmImage: ubuntu-latest
# -------------- YOUR VALUES HERE---------------------------
variables:
- name: service_connection
  value: 
- name: storage_account_name 
  value: 
# ---------------------------------
steps:
- task: AzureCLI@2
  inputs:
    azureSubscription: '$(service_connection)'
    scriptType: 'bash'
    scriptLocation: 'scriptPath'
    scriptPath: 'labs/codes/backend/pre-req.sh'

- task: TerraformInstaller@1
  inputs:
    terraformVersion: 'latest'

- task: TerraformTaskV4@4
  inputs:
    provider: 'azurerm'
    command: 'init'
    workingDirectory: 'labs/codes/vm-using-provisioners'
    backendAzureRmUseEnvironmentVariablesForAuthentication: true
    backendServiceArm: '$(service_connection)'
    backendAzureRmResourceGroupName: 'terraform-backend-rg'
    backendAzureRmStorageAccountName: $(storage_account_name)
    backendAzureRmContainerName: 'tfstate'
    backendAzureRmKey: 'pipeline.tfstate'

- task: TerraformTaskV4@4
  inputs:
    provider: 'azurerm'
    command: 'apply'
    workingDirectory: 'labs/codes/vm-using-provisioners'
    commandOptions: '-auto-approve'
    environmentServiceNameAzureRM: '$(service_connection)'
```


## REPLACE THE VARIABLES WITH YOUR VALES

### click on save and run option on top right side


### Key Steps Breakdown:
- **Install Terraform Version**: If you need to install a specific version of Terraform, use the `UseTerraform@0` task to specify the version.
- **Terraform Init**: Initializes the Terraform working directory and configures the backend storage if needed (e.g., Azure Blob Storage).
- **Terraform Plan**: Prepares an execution plan. It checks what changes Terraform will apply to your infrastructure.
- **Terraform Apply**: Executes the changes in your Azure environment by applying the Terraform plan.
- **Terraform Output** (optional): Displays the output values from the Terraform configuration.


### Step 5: Trigger the Pipeline

1. After committing the YAML file, the pipeline should automatically trigger based on the trigger condition (e.g., on a push to the `main` branch).
2. Monitor the pipeline run to ensure the Terraform tasks execute correctly.

### Troubleshooting

- If Terraform isn't executing as expected, review the **Pipeline logs** to identify where the issue might be.
- Ensure that the Azure service connection (`azureSubscription`) has the correct permissions to manage the required Azure resources.
- If you're using an Azure Storage Account backend for Terraform state, make sure the storage account, container, and key are correctly set up.

Let me know if you need any more details on any of these steps!
