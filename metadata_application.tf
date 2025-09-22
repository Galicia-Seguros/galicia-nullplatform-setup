terraform {
  required_providers {
    nullplatform = {
      source  = "nullplatform/nullplatform"
      version = "~> 0.0.63"
    }
  }
}
provider "nullplatform" {
  api_key = ""
}
resource "nullplatform_metadata_specification" "metadata_application" {
  name        = "Application Metadata"
  description = "Add metadata to application"
  nrn         = "organization=1665728807:account=1521942788:namespace=652806758"
  entity      = "application"
  metadata    = "metadata_application"

  schema = jsonencode({
    type = "object"
    properties = {
      "Responsible": {
        "description": "Person assigned as responsible for the application.",
        "type": "string",
        "enum": ["Federico Ferrari", "Silvia Accasuso","Juan Dominguez"]
      },
      "PCI": {
        "description": "Is the application PCI compliant?",
        "type": "string",
        "enum": ["Yes", "No"]
      },
      "SLO": {
        "description": "What type of SLO does the application have?",
        "type": "string",
        "enum": ["Critical", "High","Medium", "Low"]
      }
    }
    "required": [
      "PCI",
      "Responsible"
    ],
    additionalProperties = false
  })
}
