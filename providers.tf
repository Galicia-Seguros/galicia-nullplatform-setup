terraform {
  required_providers {
    nullplatform = {
      source  = "nullplatform/nullplatform"
      version = ">= 0.0.67" # ajustá a la versión que uses
    }
  }
}

provider "azurerm" {
  subscription_id = var.azure_subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


provider "nullplatform" {

  api_key = var.np_api_key
}
