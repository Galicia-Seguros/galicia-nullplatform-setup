####nullprovider

module "nullplatform_registry" {
  source = "git::https://github.com/nullplatform/infrastructure-configurations.git//azure/modules/nullplatform/providers/config?ref=main"

  account      = var.account
  nrn          = var.nrn
  cluster_name = var.cluster_name

  azure_client_id         = var.client_id
  azure_client_secret     = var.client_secret
  azure_subscription_id   = var.azure_subscription_id
  azure_tenant_id         = var.azure_tenant_id
  azure_resource_group_id = var.azure_resource_group_name

  domain_name = var.domain_name

}
/* Configure ACR as assets */
module "assets-repository" {
  source = "git@github.com:nullplatform/main-terraform-modules.git//modules/nullplatform/provider/asset/docker-server?ref=main"
  nrn    = var.nrn

  login_server = var.login_server
  username     = var.acr_username
  password     = var.acr_password
  path         = "nullplatform"
}
/* Configure github as repository */
module "code-repository" {
  source = "git@github.com:nullplatform/main-terraform-modules.git//modules/nullplatform/provider/code/github?ref=main"
  nrn    = var.nrn

  organization                 = var.github_organization
  organization_installation_id = var.github_organization_installation_id
}
/* dimmesions to account */
module "dimensions" {
  source = "git@github.com:nullplatform/main-terraform-modules.git//modules/nullplatform/dimensions?ref=main"
  nrn    = var.nrn
}
