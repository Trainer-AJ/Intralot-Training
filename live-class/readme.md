## Create service principal
go here - https://portal.azure.com/#view/Microsoft_Azure_Billing/SubscriptionsBladeV2
 
copy subscription id 
paste the value here :
 
copy and run this commands in cloudshell:
 
```sh
sub=
 
az ad sp create-for-rbac --role contributor --scope subscriptions/$sub
```
