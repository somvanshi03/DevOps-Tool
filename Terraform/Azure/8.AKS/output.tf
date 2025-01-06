output "resource_group_name" {
  value = azurerm_resource_group.Terraform-RG.name
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.myAKSCluster.name
}

output "kube_config_path" {
  value = "${path.module}/kubeconfig.yaml"
}
