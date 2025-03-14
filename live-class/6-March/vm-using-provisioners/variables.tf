# variable "password" {
#  description = "login password for the VM" 
# }

variable "subnet_nsg_rules" {
  type = list(object(
    {
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }
  ))

}