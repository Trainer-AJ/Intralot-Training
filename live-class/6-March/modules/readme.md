1. In azure CloudSHell:
```sh
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/your-subscription-id"
```
2. run this in your local computer terminal (make sure you are in folder)

```sh
$env:ARM_CLIENT_ID = "dd5d7f63-620b-43c0-ac31-a29803471b0d"
$env:ARM_CLIENT_SECRET = xxxxxx"
$env:ARM_TENANT_ID = "cb561bac-8eae-4e86-979a-765c514af3ae"
$env:ARM_SUBSCRIPTION_ID = "547f4c97-23fe-44de-9171-759dbe20dc93"
```

3. terraform init
4. terraform apply
5. copy paste URL in browser... you see webpage
