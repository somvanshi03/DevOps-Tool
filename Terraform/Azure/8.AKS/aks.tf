
resource "azurerm_kubernetes_cluster" "myAKSCluster" {
  name                = "myAKSCluster"
  location            = "East US"
  resource_group_name = "Terraform-RG"
  dns_prefix          = "myAKSCluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
  }
  depends_on = [azurerm_resource_group.Terraform-RG]
}
