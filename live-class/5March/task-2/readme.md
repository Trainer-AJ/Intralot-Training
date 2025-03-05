# Steps to follow:

1. create new folder
2. (if needed) create a service principal
```
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"
```
3. download and edit `providers.tf` file


