output "resource_group_name" {
  description = "Name of project Resource group"
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "ID of project resource group"
  value       = azurerm_resource_group.main.id
}

output "resource_group_location" {
  description = "Location of project resource group"
  value       = azurerm_resource_group.main.location
}


output "cluster_name" {
  description = "Name of the cluster"
  value       = azurerm_kubernetes_cluster.main.name
}

output "cluster_credentials" {
  description = "Command to get the configuration details of te cluster"
  value       =  "az aks get-credentials --resource-group ${azurerm_resource_group.main.name} --name ${azurerm_kubernetes_cluster.main.name} --overwrite-existing"
}