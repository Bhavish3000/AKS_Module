
variable "resource_group" {
  type = object({
    name       = string
    location   = string
    managed_by = string
  })
  default = {
    location   = "east us"
    name       = "aks"
    managed_by = "Bhavish"
  }

}


variable "kubernetes_cluster" {
  type = object({
    name           = string
    dns_prefix     = string
    node_pool_name = string
    node_count     = number
    vm_size        = string
    identity_type  = string
  })

  default = {
    name           = "AKS_cluster"
    dns_prefix     = "AKS"
    node_pool_name = "default"
    node_count     = 1
    vm_size        = "Standard_D4s_v3"
    identity_type  = "SystemAssigned"
  }

}

variable "log_analytics_workspace" {
  type = object({
    name = string
    sku                 = string
    retention_in_days   = number
  })

  default = {
    name = "AKS-log-analytics-workspace"
    sku                 = "PerGB2018"
    retention_in_days   = 30
  }
  
}


variable "monitor_workspace" {
  type = object({
    name = string
  })

  default = {
    name = "aks-prometheus-workspace"
  }
}

variable "dashboard_grafana" {
  type = object({
    name = string
    sku = string
    grafana_major_version = number
  })
  
  default = {
    name = "aks-grafana"
    sku = "Standard"
    grafana_major_version = 11
  }
}