output "resource_group_name" {
  value = azurerm_resource_group.Terraform-RG.name
}

output "container_group_name" {
  value = azurerm_container_group.nginx.name
}

