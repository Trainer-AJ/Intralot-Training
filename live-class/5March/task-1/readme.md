# Do it Yourself
> 1. Create a variable for resource Group Name
> 2. Create variables for tags in vnet and resource groups
> 3. the Tag variables should have default value of "env" = "prod"
> 4. edit the terraform tfvars file to include the variable value as "env" = "dev-test"
> 5. Run terraform plan and terraform apply
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
