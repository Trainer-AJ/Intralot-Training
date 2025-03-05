# Do it Yourself
> 1. Create a variable for resource Group Name in main.tf file
> 2. Create variables for tags for resource groups in main.tf file
> 3. the Tag variables should have default value of "env" = "prod"
> 4. edit the terraform tfvars file to include the variable value as "env" = "dev-test"
> 5. Run terraform plan and terraform apply
refrence links:
1. variables : https://developer.hashicorp.com/terraform/language/values/variables
2. resource groups: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
3. check my code [here]()
----------------------------------------------
# 1. Create a new folder
# 2. Download main.tf, providers.tf, variables.tf
# 3. run terraform init => plan 
# 4. it should ask for variables value.... provide below
```
location = "eastus"
dns_servers - ["10.0.0.6", "10.0.0.9"]
```
# 5. download terraform tfvars now
# run terraform plan and apply 
