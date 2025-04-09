 resource "azurerm_public_ip" "example" {
   # count is a Meta Argument here
   name                = "terraform-ip"
   resource_group_name = azurerm_resource_group.example.name
   location            = azurerm_resource_group.example.location
   allocation_method   = "Static"
 }
 output "ip" {
   # zipmap(key_list,value_list)
   value = azurerm_public_ip.example.ip_address
 }