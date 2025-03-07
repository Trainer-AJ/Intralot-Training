## AIM: To run Terraform code in an Azure DevOps YAML pipeline using the Terraform extension, follow these steps:

### Step 1: Set Up Azure DevOps Environment

1. **Create an Azure DevOps Project**: If you don’t already have one, create a new project in Azure DevOps.
   
2. **Install Terraform Extension**:
   - Go to the **Azure DevOps marketplace** and search for the **Terraform extension**.
   - Install the **Terraform** extension to your Azure DevOps organization. This extension will provide the necessary tasks for working with Terraform.

3. **Service Connection to Azure**:
   - In Azure DevOps, go to your project settings.
   - Under **Service connections**, create a new **Azure Resource Manager** service connection. This connection will be used by Terraform to authenticate and interact with Azure resources.


### Step 2: Create the YAML Pipeline

1. **Go to Pipelines** in Azure DevOps and create a new pipeline.
2. Choose **YAML** for the pipeline configuration.
3. Add the following sample YAML code to define the Terraform pipeline. This example assumes you're using the **Terraform Extension** in Azure DevOps.

### Example Pipeline YAML
go to left side pipeline option
click on `New Pipeline` the blue button on top right side
choose first option => azure repos git 
click on `eshoponweb`

### paste the below code

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
