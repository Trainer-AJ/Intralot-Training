# authenticate using azuer CLI 

### after installing azure CLI run the command in your local computer terminal :
az login 
 
### provide credentials from xtremelabs
 
### press enter when it asks for subscriptuon 
 
### then to verify everything is good ....
run az account show in your local terminal

> make sure you are in approach-2 folder

**Put your subscription_id in providers.tf file**

## test it
```sh
terraform init
terraform plan
terraform validate
terraform apply -auto-approve
```
