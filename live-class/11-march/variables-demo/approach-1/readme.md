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
