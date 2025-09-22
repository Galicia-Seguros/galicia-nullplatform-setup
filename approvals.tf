terraform {
  required_providers {
    nullplatform = {
      source  = "nullplatform/nullplatform"
      version = "0.0.63"
    }
  }
}
provider "nullplatform" {
  api_key = ""
}

resource "nullplatform_approval_policy" "coverage" {
  nrn    = "organization=xxxxxxxxxxx:account=xxxxxxxxx:namespace=xxxxxxxx"
  name   = "Code Coverage"
  conditions = jsonencode({
    "build.metadata.coverage.coverage" = { "$gte": 80 }
  })
}

resource "nullplatform_approval_policy" "security" {
  nrn    = "organization=xxxxxxxxxxx:account=xxxxxxxxx:namespace=xxxxxxxx"
  name   = "Security"
  conditions = jsonencode({
    "build.metadata.security.critical" = { "$eq": 0 }
  })
}

resource "nullplatform_approval_policy" "PCI" {
  nrn    = "organization=xxxxxxxxxxx:account=xxxxxxxxx:namespace=xxxxxxxx"
  name   = "PCI"
  conditions = jsonencode({
    "application.metadata.metadata_application.PCI" = "No"
  })
}

resource "nullplatform_approval_action" "deployment_create" {
  nrn = "organization=xxxxxxxxxxx:account=xxxxxxxxx:namespace=xxxxxxxx"
  entity = "deployment"
  action = "deployment:create"

  dimensions = {
    environment = "production"
  }

  on_policy_success = "approve"
  on_policy_fail = "manual"

  lifecycle {
    ignore_changes = [policies]
  }
}

resource "nullplatform_approval_action_policy_association" "coverage" {
  approval_action_id  = nullplatform_approval_action.deployment_create.id
  approval_policy_id  = nullplatform_approval_policy.coverage.id
}

resource "nullplatform_approval_action_policy_association" "security" {
  approval_action_id  = nullplatform_approval_action.deployment_create.id
  approval_policy_id  = nullplatform_approval_policy.security.id
}

resource "nullplatform_approval_action_policy_association" "PCI" {
  approval_action_id  = nullplatform_approval_action.deployment_create.id
  approval_policy_id  = nullplatform_approval_policy.PCI.id
}
