# GitHub Actions OIDC

This module provisions an Azure AD Application for GitHub Actions OIDC and creates a federated identity credential on it.

## Usage

```hcl
module "github_oidc" {
  source = "git@github.com:TheSoftwareHouse/terraform-azure-github-oidc.git?ref=v1.0.0"

  display_name = "github-actions-ci"
  github_org  = "my-org"
  github_repo = "my-repo"
  description = "Federated identity for GitHub Actions in my-org/my-repo"
  role_scope = "resource-group-id"

  role_name  = "Contributor"
}
```

## Inputs

| Name          | Type   | Default | Required | Description                                                                                   |
|---------------|--------|:-------:|:--------:|-----------------------------------------------------------------------------------------------|
| `display_name`  | string | —       | yes      | Name for the Azure AD Application **and** its federated identity credential.   |
| `github_org`    | string | —       | yes      | GitHub organization (or user) owning the repository.                                         |
| `github_repo`   | string | —       | yes      | GitHub repository name to federate (used in the OIDC subject pattern).                       |
| `description`   | string | `""`    | no       | Optional description for the federated identity credential.                                   |
| `role_scope`    | string | —       | yes      | ARM scope (full resource ID) at which to assign the single RBAC role.                        |
| `role_name`     | string | —       | yes      | Built-in role definition name to assign (e.g. `"Contributor"`, `"Reader"`, etc.).            |

## Outputs

| Name                          | Description                                                       |
|-------------------------------|-------------------------------------------------------------------|
| `service_principal`              | Object of the created Azure Service Principal.                    |
| `azuread_application`                   | Object of the created Azure AD Application.              |
