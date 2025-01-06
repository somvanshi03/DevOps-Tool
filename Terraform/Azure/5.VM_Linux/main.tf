
provider "azurerm" {
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""
  features {}
}

resource "azurerm_resource_group" "Terraform-RG" {
  name     = "Terraform-RG"
  location = "East US" # Change as needed
  tags = {
    Env     = "Test"
    AppType = "Dotnet"
    Vendor  = "Mridul"
  }
}