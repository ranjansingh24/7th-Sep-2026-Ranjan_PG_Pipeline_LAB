terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "Ranjan_24"
    storage_account_name = "ranjanst2026"
    container_name       = "ranjancontainer"
    key                  = "ranjan.tfstate"

  }
}
provider "azurerm" {
  features {}
  subscription_id = "ea6c786f-3f34-4f15-a6f8-88057a9b27b9"
}


