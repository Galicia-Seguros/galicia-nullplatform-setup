provider "azurerm" {
  subscription_id = var.azure_subscription_id
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}



provider "kubernetes" {
  config_path = pathexpand("~/.kube/config")
}

provider "helm" {
  kubernetes {
   config_path = pathexpand("~/.kube/config")
   }
  }


provider "nullplatform" {
  np_apikey = var.np_api_key
  api_key   = var.np_api_key
}