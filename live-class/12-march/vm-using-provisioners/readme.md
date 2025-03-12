# Create Linux VM with Apache2

> notice line 61 to 81 in vm.tf file

### step 0: launch xtremelabs => take labs => register for MFA => i button => cloud express

### Step 1:
git pull to get latest code

### Step 2:
> **Note:** Either do az login or env NOT both 
```sh
az login
```
or
`az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"` then in your local computer terminal put your values and paste below commands....
```sh
# PowerShell
$env:ARM_CLIENT_ID = ""
$env:ARM_CLIENT_SECRET = ""
$env:ARM_TENANT_ID = ""
$env:ARM_SUBSCRIPTION_ID = ""
```

just run :

```sh
terraform init
terraform validate
terraform plan
```


## Done with above... feeling bored .... below is an extra task:
> create Azure windows **vm size: Standard_D2s_v3** with IIS installed using terraform provisioners
command to install  IIS: google it please :) 



