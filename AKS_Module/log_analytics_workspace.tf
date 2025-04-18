resource "azurerm_log_analytics_workspace" "logs" {
  name = var.log_analytics_workspace.name
  resource_group_name = azurerm_resource_group.main.name
  location = azurerm_resource_group.main.location 
  sku                 = var.log_analytics_workspace.sku
  retention_in_days   = var.log_analytics_workspace.retention_in_days
}