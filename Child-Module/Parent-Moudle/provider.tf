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
    storage_account_name = "ranjansingh24"
    container_name       = "ranjancontainer"
    key                  = "ranjan.tfstate"

  }
}
provider "azurerm" {
  features {}
  subscription_id = "cf4adfd0-252d-4813-b002-f6f2095a23a8"
}


