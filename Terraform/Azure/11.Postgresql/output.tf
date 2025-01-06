output "postgresql_server_name" {
  value = azurerm_postgresql_server.mypsql2024-server.name
}

output "postgresql_database_name" {
  value = azurerm_postgresql_database.mypsql2024-db.name
}

output "resource_group_name" {
  value = azurerm_resource_group.Terraform-RG.name
}