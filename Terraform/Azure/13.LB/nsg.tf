resource "azurerm_network_security_group" "Terraform-NSG" {
  name                = "Terraform-NSG"
  location            = "East US"
  resource_group_name = "Terraform-RG"

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow-HTTPS"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  depends_on = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_subnet_network_security_group_association" "Terraform-NSG-Association" {
  subnet_id                 = azurerm_subnet.Terraform-Subnet.id
  network_security_group_id = azurerm_network_security_group.Terraform-NSG.id
  depends_on                = [azurerm_subnet.Terraform-Subnet, azurerm_network_security_group.Terraform-NSG]
}