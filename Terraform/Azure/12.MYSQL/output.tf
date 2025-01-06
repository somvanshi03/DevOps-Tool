output "azurerm_mysql_flexible_server" {
  value = azurerm_mysql_flexible_server.mysql2024-server.name
}

output "azurerm_mysql_flexible_database" {
  value = azurerm_mysql_flexible_database.mysql2024-db.name
}

output "resource_group_name" {
  value = azurerm_resource_group.Terraform-RG.name
}