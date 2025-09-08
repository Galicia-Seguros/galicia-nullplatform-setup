variable "azure_subscription_id" {
  type        = string
  description = "Azure subscription id to create resources"
}

variable "azure_resource_group_name" {
  type        = string
  description = "Wheter to use this rg or to create one. With null one will be created"
  default     = null
}

variable "azure_tenant_id" {
  type        = string
  description = "The Azure tenant id where the subscription exists"
}

variable "location" {
  type        = string
  description = "The location/region where the resources should be created"
  default     = ""
}

variable "domain_name" {
  type        = string
  description = "The domain name to use for the DNS zone"
  nullable    = true
  default     = null
}

variable "organization" {
  type        = string
  description = "The nullplatform organization slug"
}


variable "account" {
  type        = string
  description = "The nullplatform default account slug"
}

variable "nrn" {
  type        = string
  description = "The nullplatform nrn for this organization"
}

variable "np_api_key" {
  type        = string
  description = "the Nullplatform api key"
}

variable "namespace" {
  type        = string
  description = "The default namespace to use for nullplatform applications"
  nullable    = true
  default     = null
}

variable "github_organization" {
  type        = string
  description = "The github organization to associate to nullplatform."
}

variable "github_organization_installation_id" {
  type        = string
  description = "The github installation id after installing the organization to Nullplatform github application."
}

variable "client_id" {

}

variable "client_secret" {

}

variable "acr_username" {

}
variable "acr_password" {

}
variable "login_server" {

}
variable "cluster_name" {

}
variable "env" {

}