resource "azurerm_resource_group" "example" {
  name     = "tf-resources"
  location = "West Europe"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_D2s_v3"
  disable_password_authentication = false
  admin_username      = "aj"
  admin_password = "nooPho4ae5ooyai2"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
# az vm image list --output table
  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y apache2",
      "sudo chown -R aj:aj /var/www/html/",
    ]
    connection {
    type     = "ssh"
    user     = "aj"
    # password = var.root_password
    # host     = var.host
    password = "nooPho4ae5ooyai2"
    host     = "${azurerm_public_ip.example.ip_address}"
    port    = 22
  }
  }

  provisioner "file" {
  source      = "website/"
  destination = "/var/www/html/"

  connection {
    type     = "ssh"
    user     = "aj"
    # password = var.root_password
    # host     = var.host
    password = "nooPho4ae5ooyai2"
    host     = "${azurerm_public_ip.example.ip_address}"
    port    = 22
  }
}

  # custom_data = base64encode("sudo apt-get update -y && sudo apt-get install -y apache2")
}