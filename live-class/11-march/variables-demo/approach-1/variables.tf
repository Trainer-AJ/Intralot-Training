# since NO Value specified, it will ask for value during terraform plan/apply
variable "region" {
  description = "give azure region name to deploy resources"
  default = "East US"
}

variable "rg_name" {
  description = "give azure resource group name"
   default = "rg-aci"
  
}

variable "cidr" {
  description = "give address space for vnet"
  default = ["10.0.0.0/16"]
  
}

variable "vnet_name" {
  description = "give vnet name"
  default = "vnet1"
  
}

variable "vnet_region" {
  description = "give vnet region"
  default = "East US"
  
}

variable "acr_name" {}
