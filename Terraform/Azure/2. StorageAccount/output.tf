output "resource_group_name" {
  value = azurerm_resource_group.Terraform-RG.name
}

output "storage_account_name" {
  value = azurerm_storage_account.devopshangoutstorageacc.name
}

output "file_share_name" {
  value = azurerm_storage_share.myshare.name
}

output "blob_container_name" {
  value = azurerm_storage_container.mycontainer.name
}