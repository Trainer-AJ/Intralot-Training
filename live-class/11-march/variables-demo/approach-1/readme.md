## set up
```
git clone https://github.com/Trainer-AJ/Intralot-Training.git
 
cd Intralot-Training/live-class/11-march/variables-demo/approach-1
```

1. Launch lab: XtremeLabs - Log On
2. get MFA done (authenticator)
3. create sp : az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"
4. replace values in azure-providers.tf file

## ask for vraible value
1. put in command line value for name
2. put 
```sh
terraform apply --auto-approve -var="region=westus" 
```

### if that much done
### Extra activity 
### Create a VNet in Azure with its addrress space and region and name as a variable
```sh
git pull
terraform apply --auto-approve
```
# ...after terraform destroy...
## now rename terraform.tfvars to vnet.tfvars then run terraform apply once again....
## our goal is to have a virtual network:
> name = "tfvars-vnet1" & region = "centralindia"

😭 didn't worked as expected...

now run 
```sh
terraform apply -auto-approve -var-file="vnet.tfvars"
```
