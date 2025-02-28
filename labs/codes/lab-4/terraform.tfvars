# terraform.tfvars

# Variable for location of the resource group
location = "East US"

# Variable for resource group details (map with two resource groups)
rg_details = {
    "name"  = "Map-RG"
    "region" = "West Europe"
}

# Variable for resource group list (list)
rg_list = ["List_RG", "Eastus"]

# Variable for location list used with count
location_list = ["East US", "Central India", "South India"]
