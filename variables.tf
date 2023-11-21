variable "name" {
  description = "Variable set name"
  type        = string
}

variable "description" {
  description = "Variable set description"
  type        = string
}

variable "organization" {
  description = "Organization name for variable set"
  type        = string
}

variable "variables" {
  default     = {}
  description = "Variables to create in the variable set"
  type = map(object({
    value     = string
    category  = optional(string, "terraform")
    hcl       = optional(bool, false)
    sensitive = optional(bool, false)
  }))

  validation {
    condition = alltrue([
      for k, v in var.variables : can(contains(["env", "terraform"], v.category))
    ])
    error_message = "values must be in [\"env\", \"terraform\"]"
  }

  validation {
    condition = alltrue([
      for k, v in var.variables : can(!v.hcl) if v.category == "env"
    ])
    error_message = "hcl cannot be true if category is env"
  }
}
