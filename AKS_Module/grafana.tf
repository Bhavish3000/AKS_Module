# Managed Grafana workspace

resource "azurerm_dashboard_grafana" "grafana" {
  name                = var.dashboard_grafana.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  grafana_major_version = var.dashboard_grafana.grafana_major_version
  sku                 = var.dashboard_grafana.sku
  identity {
    type = "SystemAssigned"
  }
}

# Link Grafana to Prometheus (Azure Monitor workspace)

resource "azurerm_dashboard_grafana_integration" "prometheus" {
  grafana_id           = azurerm_dashboard_grafana.grafana.id
  monitor_workspace_id = azurerm_monitor_workspace.prometheus.id
}


# Link Grafana to Log Analytics (for logs)

resource "azurerm_role_assignment" "grafana_logs_reader" {
  scope                = azurerm_log_analytics_workspace.logs.id
  role_definition_name = "Log Analytics Reader"
  principal_id         = azurerm_dashboard_grafana.grafana.identity[0].principal_id
}