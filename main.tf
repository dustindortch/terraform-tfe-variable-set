terraform {
  required_version = "~> 1.9"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.58"
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

resource "tfe_project_variable_set" "project" {
  for_each = toset(var.project_ids)

  project_id      = each.key
  variable_set_id = tfe_variable_set.set.id
}

resource "tfe_workspace_variable_set" "workspace" {
  for_each = toset(var.workspace_ids)

  workspace_id    = each.key
  variable_set_id = tfe_variable_set.set.id
}
