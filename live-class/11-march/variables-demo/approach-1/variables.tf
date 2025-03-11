# since NO Value specified, it will ask for value during terraform plan/apply
variable "region" {
  description = "give azure region name to deploy resources"
  default = "East US"
}

variable "rg_name" {
  description = "give azure resource group name"
  # default = "rg-aci"
  
}

