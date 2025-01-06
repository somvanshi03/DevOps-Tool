resource "azurerm_storage_account" "devopshangoutstorageacc" {
  name                     = "devopshangoutstorageacc"
  resource_group_name      = "Terraform-RG"
  location                 = "East US"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
  depends_on = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_storage_share" "myshare" {
  name                 = "myshare"
  storage_account_name = azurerm_storage_account.devopshangoutstorageacc.name
  quota                = 1
  #depends_on = [azurerm_storage_account.devopshangoutstorageacc]
}

resource "azurerm_storage_container" "mycontainer" {
  name                  = "mycontainer"
  storage_account_name   = azurerm_storage_account.devopshangoutstorageacc.name
  container_access_type  = "private"
  #depends_on = [azurerm_storage_account.devopshangoutstorageacc]
}