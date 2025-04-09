

### Scenario:
1. Create an Azure virtual machine (VM).
2. Use the `remote-exec` provisioner to install Apache web server on the VM after it's created.
3. Use the `local-exec` provisioner to run a local script on your machine after the infrastructure is created.

### Step 1: Define the Terraform Configuration

Create a file called `main.tf` for your Terraform configuration. Here's the complete configuration:

```hcl
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Create a virtual network
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Create a subnet in the virtual network
resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a public IP address for the VM
resource "azurerm_public_ip" "example" {
  name                         = "example-public-ip"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  allocation_method            = "Dynamic"
}

# Create a Network Interface (NIC) for the VM
resource "azurerm_network_interface" "example" {
  name                      = "example-nic"
  location                 = azurerm_resource_group.example.location
  resource_group_name      = azurerm_resource_group.example.name
  virtual_network_name     = azurerm_virtual_network.example.name
  subnet_id                = azurerm_subnet.example.id
  public_ip_address_id     = azurerm_public_ip.example.id

  tags = {
    environment = "dev"
  }
}

# Create an Azure Virtual Machine
resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-vm"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = "Standard_B1s"
  admin_username      = "adminuser"
  admin_password      = "P@ssw0rd1234!"  # Ensure this is replaced with a more secure password or use SSH key-based auth
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]
  image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  # Remote-exec provisioner to install Apache web server on the VM
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install apache2 -y",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]

    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = "P@ssw0rd1234!"  # Replace with actual password or use SSH key
      host        = self.public_ip_address
    }
  }

  # Local-exec provisioner to run a script after the VM is created
  provisioner "local-exec" {
    command = "echo VM creation completed!"
  }

  tags = {
    environment = "production"
  }
}
```

### Step 2: Initialize Terraform
In your terminal, navigate to the directory containing `main.tf`, then initialize Terraform.

```bash
terraform init
```

### Step 3: Apply the Configuration

Now, apply the Terraform configuration to create the Azure resources and execute the provisioners.

```bash
terraform apply
```

### Explanation:

1. **Resource Group and Virtual Network**: This creates a resource group and a virtual network in Azure.
2. **Subnet**: A subnet within the virtual network.
3. **Public IP**: A dynamic public IP for the virtual machine.
4. **Network Interface**: The NIC for the VM, which includes the public IP.
5. **Virtual Machine**: A Linux VM running Ubuntu, with an attached NIC.

### Provisioners Used:
- **Remote-exec**: Once the VM is created, the `remote-exec` provisioner connects to the VM over SSH using the provided username and password. It runs the commands to install Apache (`sudo apt-get update`, `sudo apt-get install apache2`, etc.).
- **Local-exec**: The `local-exec` provisioner runs a simple `echo` command on your local machine after the VM is created, confirming the success of the process.

### Step 4: Verify the Setup
1. After the VM is created and provisioned, check the public IP assigned to the VM and try to access the Apache web server by navigating to `http://<public-ip>` in your web browser.
2. Also, check your terminal for the output from the `local-exec` provisioner, which should display `VM creation completed!`.

### Step 5: Clean Up
After you are done, you can destroy the resources to avoid unnecessary costs:

```bash
terraform destroy
```

### Notes:
- The example uses a password-based authentication for SSH, but you can use SSH keys instead for better security.
- Make sure to update the `admin_password` or use SSH key-based authentication if possible.
- You can add more custom scripts in `remote-exec` for further configuration or automation.

This is just a simple example. You can modify it as per your requirements to handle more complex provisioning tasks in Azure.
