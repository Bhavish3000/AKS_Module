resource "azurerm_resource_group" "main" {
  name       = var.resource_group.name
  location   = var.resource_group.location
  managed_by = var.resource_group.managed_by
}