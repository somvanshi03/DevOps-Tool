resource "azurerm_container_group" "nginx" {
  name                = "nginx"
  location            = "East US"
  resource_group_name = "Terraform-RG"
  ip_address_type     = "Public"
  dns_name_label      = "nginx"
  os_type             = "Linux"

  container {
    name   = "nginx"
    image  = "nginx:latest" # Example image
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
  tags = {
    environment = "testing"
  }
  depends_on = [azurerm_resource_group.Terraform-RG]
}