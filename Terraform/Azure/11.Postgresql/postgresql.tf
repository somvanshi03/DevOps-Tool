
resource "azurerm_postgresql_server" "mypsql2024-server" {
  name                         = "mypsql2024-server"
  resource_group_name          = "Terraform-RG"
  location                     = "East US"
  sku_name                     = "B_Gen5_2"
  storage_mb                   = 5120
  administrator_login          = "adminlogin"
  administrator_login_password = "AdminP@ssword123"

  version                 = "11"
  ssl_enforcement_enabled = true
  
  depends_on = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_postgresql_database" "mypsql2024-db" {
  name                = "mypsql2024-db"
  resource_group_name = "Terraform-RG"
  server_name         = azurerm_postgresql_server.mypsql2024-server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
  
  depends_on = [azurerm_postgresql_server.mypsql2024-server]
}