output "resource_group_name" {
  value = azurerm_resource_group.Terraform-RG.name
}

output "vnet_name" {
  value = azurerm_virtual_network.Terraform-vNet.name
}

output "subnet_name" {
  value = azurerm_subnet.Terraform-Subnet.name
}

output "nsg_name" {
  value = azurerm_network_security_group.Terraform-NSG.name
}

#output "vm_name" {
#  value = azurerm_windows_virtual_machine.Terraform-VM.name
#}