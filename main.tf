terraform {
  required_version = "~> 1.6"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.50"
    }
  }
}

resource "tfe_variable_set" "set" {
  name         = var.name
  description  = var.description
  organization = var.organization
}

resource "tfe_variable" "var" {
  for_each = var.variables

  key             = each.key
  value           = each.value.value
  category        = each.value.category
  sensitive       = each.value.sensitive
  variable_set_id = tfe_variable_set.set.id
}
