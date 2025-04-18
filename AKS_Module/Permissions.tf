# Allow Grafana to read AKS metrics
resource "azurerm_role_assignment" "grafana_metrics_reader" {
  scope                = azurerm_kubernetes_cluster.main.id
  role_definition_name = "Monitoring Reader"
  principal_id         = azurerm_dashboard_grafana.grafana.identity[0].principal_id
}

# Allow Grafana to query Prometheus
resource "azurerm_role_assignment" "grafana_prometheus" {
  scope                = azurerm_monitor_workspace.prometheus.id
  role_definition_name = "Monitoring Data Reader"
  principal_id         = azurerm_dashboard_grafana.grafana.identity[0].principal_id
}
