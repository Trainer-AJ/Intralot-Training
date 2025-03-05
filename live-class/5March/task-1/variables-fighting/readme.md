# task:
To identify variables precendence

# commands to run : one by one

```sh
$env:rg-name = "environment-vars"
terraform apply --auto-approve
```

# once again notice the name of resource group created 
```sh
terraform destroy --auto-approve
terraform apply -var="rg-name=var-option" --auto-approve
```
# once again notice the name of resource group created 
```sh

terraform apply -var="rg-name=var-option" -var-file=name.tfvars --auto-approve
```
# once again notice the name of resource group created 
