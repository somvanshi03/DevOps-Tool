
resource "azurerm_linux_virtual_machine" "Terraform-VM" {
  name                = "Terraform-VM"
  resource_group_name = "Terraform-RG"
  location            = "East US"
  size                = "Standard_B1MS"
  admin_username      = "adminuser"
  admin_password      = "P@ssword1234!" # Use a secure password
  disable_password_authentication = false
  
  network_interface_ids = [
    azurerm_network_interface.Terraform-NIC.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  depends_on = [azurerm_subnet_network_security_group_association.Terraform-NSG-Association]
}


resource "azurerm_public_ip" "Terraform-IP" {
  name                = "Terraform-IP"
  resource_group_name = "Terraform-RG"
  location            = "East US"
  allocation_method   = "Static"
  depends_on = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_managed_disk" "appdisk" {
  name                 = "appdisk"
  location             = "East US"
  resource_group_name  = "Terraform-RG"
  storage_account_type = "Premium_LRS"
  create_option        = "Empty"
  disk_size_gb         = "16"
  depends_on = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_virtual_machine_data_disk_attachment" "appdiskattach" {
  managed_disk_id    = azurerm_managed_disk.appdisk.id
  virtual_machine_id = azurerm_linux_virtual_machine.Terraform-VM.id
  lun                = "0"
  caching            = "ReadWrite"
}