
resource "azurerm_mysql_flexible_server" "mysql2024-server" {
  name                = "mysql2024-server"
  resource_group_name = "Terraform-RG"
  location            = "East US"
  sku_name                     = "GP_Standard_D2ds_v4"
  version                      = "8.0.21"
  

  depends_on = [azurerm_resource_group.Terraform-RG]
}

resource "azurerm_mysql_flexible_database" "mysql2024-db" {
  name                = "mypsql2024-db"
  resource_group_name = "Terraform-RG"
  server_name         = azurerm_mysql_flexible_server.mysql2024-server.name
  charset             = "utf8"  # Required
  collation           = "utf8_general_ci"  # Optional, adjust as needed

  depends_on = [azurerm_mysql_flexible_server.mysql2024-server]
}