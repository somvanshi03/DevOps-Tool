resource "azurerm_public_ip" "Terraform-LB-PIP"{
  name                = "Terraform-LB-PIP"
  resource_group_name = "Terraform-RG"
  location            = "East US"
  allocation_method   = "Static"
  sku = "Standard"
depends_on = [
    azurerm_resource_group.Terraform-RG
  ]
}

resource "azurerm_lb" Terraform-LB{
  name                = "Terraform-LB"
  location            = "East US"
  resource_group_name = "Terraform-RG"
  sku = "Standard"
  sku_tier = "Regional"
  frontend_ip_configuration {
    name                 = "Terraform-LB-PIP"
    public_ip_address_id = azurerm_public_ip.Terraform-LB-PIP.id
  }
  depends_on = [
    azurerm_public_ip.Terraform-LB-PIP
  ]
}

# Backend Address Pool
resource "azurerm_lb_backend_address_pool" "imagepool" {
  loadbalancer_id = azurerm_lb.Terraform-LB.id
  name            = "imagepool"
  depends_on = [
    azurerm_lb.Terraform-LB
  ]
}

# Health Probe
resource "azurerm_lb_probe" "Terraform-LB-Probe" {
  name                = "Terraform-LB-Probe"
#  resource_group_name = "Terraform-RG"
  loadbalancer_id     = azurerm_lb.Terraform-LB.id
  protocol            = "Http"
  port                = 80
  request_path        = "/"
  interval_in_seconds = 5
  number_of_probes    = 2
  depends_on = [
    azurerm_lb.Terraform-LB
  ]
}

# Load Balancer Rule
resource "azurerm_lb_rule" "RuleA" {
  loadbalancer_id                = azurerm_lb.Terraform-LB.id
  name                           = "RuleA"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "Terraform-LB-PIP"
  probe_id = azurerm_lb_probe.Terraform-LB-Probe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.imagepool.id]
  depends_on = [
    azurerm_lb.Terraform-LB
  ]
}
