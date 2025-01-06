resource "azurerm_virtual_network" "Terraform-vNet" {
  name                = "Terraform-vNet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "Terraform-RG"
  depends_on          = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_subnet" "Terraform-Subnet" {
  name                 = "Terraform-Subnet"
  resource_group_name  = "Terraform-RG"
  virtual_network_name = "Terraform-vNet"
  address_prefixes     = ["10.0.1.0/24"]
  depends_on           = [azurerm_virtual_network.Terraform-vNet]
}

resource "azurerm_network_interface" "Terraform-NIC" {
  name                = "Terraform-NIC"
  location            = "East US"
  resource_group_name = "Terraform-RG"

  ip_configuration {
    name                          = "Terraform-ip-config"
    subnet_id                     = azurerm_subnet.Terraform-Subnet.id
    private_ip_address_allocation = "Dynamic"
    #    public_ip_address_id          = azurerm_public_ip.Terraform-IP.id
  }

  depends_on = [azurerm_subnet.Terraform-Subnet]
}
