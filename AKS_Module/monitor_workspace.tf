resource "azurerm_monitor_workspace" "prometheus" {
  name = var.monitor_workspace.name
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}