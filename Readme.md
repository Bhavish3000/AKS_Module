# Azure Kubernetes Service (AKS) Deployment Using Terraform
===========================================================

This project provides a Terraform configuration module for deploying an Azure Kubernetes Service (AKS) cluster. It includes the creation of a resource group and an AKS cluster with a default node pool.

# Overview

**Resource Group:** The configuration creates a resource group named "aks" in the "east us" location by default.

**AKS Cluster:** An AKS cluster named "AKS_cluster" is created with a DNS prefix "AKS". The default node pool is named "default" and consists of one node with a VM size of "Standard_D4s_v3".

**Identity Type:** The AKS cluster uses a system-assigned identity. 


# Terraform Configuration

**Resource Group Variables**

variable Name: "resource_group" 
type = object
parameters:
  name       = string
  location   = string
  managed_by = string

default values:
  location   = "east us"
  name       = "aks"
  managed_by = "Bhavish"



**Kubernetes Cluster Variables**

variable Name: "kubernetes_cluster" 
type = object
parameters:
  name           = string
  dns_prefix     = string
  node_pool_name = string
  node_count     = number
  vm_size        = string
  identity_type  = strin>g


default values:
  name           = "AKS_cluster"
  dns_prefix     = "AKS"
  node_pool_name = "default"
  node_count     = 1
  vm_size        = "Standard_D4s_v3"
  identity_type  = "SystemAssigned"

