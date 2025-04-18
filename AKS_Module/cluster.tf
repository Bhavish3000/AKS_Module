resource "azurerm_kubernetes_cluster" "main" {

  name                = var.kubernetes_cluster.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = var.kubernetes_cluster.dns_prefix

  default_node_pool {
    name       = var.kubernetes_cluster.node_pool_name
    node_count = var.kubernetes_cluster.node_count
    vm_size    = var.kubernetes_cluster.vm_size

  }

  identity {
    type = var.kubernetes_cluster.identity_type
  }

  monitor_metrics {
    annotations_allowed = null
    labels_allowed      = null
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.logs.id
  }

}