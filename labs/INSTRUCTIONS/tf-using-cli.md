## Create AZ CLI Authentication

### Pipeline YAML
- go to left side pipeline option
- click on New Pipeline the blue button on top right side
- choose first option => azure repos git
- click on `starter pipleine`

```yml
trigger:
- main
- conflict

pool:
  vmImage: ubuntu-latest
#========================================
variables:
- name: SUBCRIPTION_ID
  value: "your-subscription-id"
- name: service_connection
  value: "your-service-connection-name"
- name: DIR
  value: "labs/codes/oidc-aks"
# ================================================

steps:
# - task: AzureKeyVault@2
#   inputs:
#     azureSubscription: 'oidc'
#     KeyVaultName: 'ts76'
#     SecretsFilter: '*'
#     RunAsPreJob: true
- task: AzureCLI@2
  name: set_variables
  displayName: setup 
  inputs:
    azureSubscription: 'oidc'
    scriptType: 'pscore'
    scriptLocation: 'inlineScript'
    inlineScript: |
      Write-Host "##vso[task.setvariable variable=ARM_USE_OIDC]true"
      Write-Host "##vso[task.setvariable variable=ARM_OIDC_TOKEN]$env:idToken"
      Write-Host "##vso[task.setvariable variable=ARM_CLIENT_ID]$env:servicePrincipalId"
      Write-Host "##vso[task.setvariable variable=ARM_SUBSCRIPTION_ID]$(az account show --query id -o tsv)"
      Write-Host "##vso[task.setvariable variable=ARM_TENANT_ID]$env:tenantId"
      terraform init -upgrade
      terraform plan -out tfplan  
      terraform show -json tfplan > tfplan.json   
    addSpnToEnvironment: true
    workingDirectory: $(DIR)
  env:
    ARM_SUBSCRIPTION_ID: $(SUBCRIPTION_ID)
#################
# visualize json file here: https://hieven.github.io/terraform-visual/plan-details

- task: AzureCLI@2
  name: apply
  displayName: apply
  inputs:
    azureSubscription: 'oidc'
    scriptType: 'pscore'
    scriptLocation: 'inlineScript'
    inlineScript: 'terraform apply --auto-approve'
    addSpnToEnvironment: true
    workingDirectory: $(DIR)
  env:
    ARM_SUBSCRIPTION_ID: $(SUBCRIPTION_ID)
