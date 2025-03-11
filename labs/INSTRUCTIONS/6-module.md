### Summary of What We need to Do:
1. Created a reusable module: We created a module in modules/vnet to deploy a Virtual Network and a Subnet in Azure.
2. Use the module: In the main configuration, we used this module to create the resources by providing values for its variables.
3. Initialized and applied: We initialized Terraform and applied the configuration to create resources in Azure.

### set up
```sh
cd labs/codes/modules-demo
```

## create a module 
1. notice the contents of folder **blob_static_site**
2. we have a **main.tf** file -- where we soecify details of how to use modules
3. terraform init ==> plan => appply
