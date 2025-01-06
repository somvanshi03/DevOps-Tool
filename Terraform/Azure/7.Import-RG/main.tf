provider "azurerm" {
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}
resource "azurerm_resource_group" "Dev-RG" {
  name     = "Dev-RG"
  location = "East US"
}