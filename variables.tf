variable "display_name" {
  description = "Name for the federated identity credential."
  type        = string
  default     = "github-actions-oidc"
}

variable "github_org" {
  description = "GitHub repo organization."
  type        = string
}

variable "github_repo" {
  description = "GitHub repository name."
  type        = string
}

variable "description" {
  description = "Optional description for the federated credential."
  type        = string
  default     = null
}

variable "role_scope" {
  description = "The ARM scope at which to assign the role (e.g. a resource group or subscription ID)."
  type        = string
}

variable "role_name" {
  description = "Built-in role definition name to assign (e.g. 'Contributor')."
  type        = string
}
