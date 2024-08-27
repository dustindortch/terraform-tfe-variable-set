variable "name" {
  description = "Variable set name"
  type        = string
}

variable "description" {
  default     = ""
  description = "Variable set description"
  type        = string
}

variable "global" {
  default     = false
  description = "(Default: false) Enable as global variable set"
  type        = bool
}

variable "organization" {
  description = "Organization name for variable set"
  type        = string
}

variable "priority" {
  default     = false
  description = "(Default: false) Enable as priority variable set"
  type        = bool
}

variable "variables" {
  default     = {}
  description = "Variables to create in the variable set"
  type = map(object({
    value       = string
    category    = optional(string, "terraform")
    description = optional(string, "")
    hcl         = optional(bool, false)
    sensitive   = optional(bool, false)
  }))

  # validation {
  #   condition = alltrue([
  #     for k, v in var.variables : can(contains(["env", "terraform"], v.category))
  #   ])
  #   error_message = "values must be in [\"env\", \"terraform\"]"
  # }

  # validation {
  #   condition = alltrue([
  #     for k, v in var.variables : can(!v.hcl) if v.category == "env"
  #   ])
  #   error_message = "hcl cannot be true if category is env"
  # }
}

variable "project_ids" {
  default     = []
  description = "Project ID to associate with the variable set"
  type        = list(string)
}

variable "workspace_ids" {
  default     = []
  description = "Workspace ID to associate with the variable set"
  type        = list(string)
}
