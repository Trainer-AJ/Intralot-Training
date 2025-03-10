### Azurerm Providers documentation: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
### Create a resource group and storage account in that resource group:

run below commands:
```
mkdir folder1
cd folder
code 10march.tf
```

### write your terraform code in `10march.tf` file to create resource group and storage account in that resource group

### Save your `10march.tf` file

### run below commands one by one now:

```sh
terraform init
terraform validate
terraform plan

terraform apply
```
### check on azure portal... you should be having a storage account now
ref link for storage account: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
