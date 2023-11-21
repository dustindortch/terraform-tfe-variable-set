# terraform-tfe-variable-set

Creates a TFC/TFE variable set and sets and assigns variables to it.

Meant to work along with the terraform-tfe-organization module.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.50 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | ~> 0.50 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_variable.var](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_variable_set.set](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Variable set description | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Variable set name | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization name for variable set | `string` | n/a | yes |
| <a name="input_variables"></a> [variables](#input\_variables) | Variables to create in the variable set | <pre>map(object({<br>    value     = string<br>    category  = optional(string, "terraform")<br>    hcl       = optional(bool, false)<br>    sensitive = optional(bool, false)<br>  }))</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_variable_set_id"></a> [variable\_set\_id](#output\_variable\_set\_id) | n/a |
| <a name="output_variables"></a> [variables](#output\_variables) | n/a |
<!-- END_TF_DOCS -->