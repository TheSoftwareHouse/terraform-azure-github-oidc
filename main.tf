data "azuread_client_config" "current" {}

resource "azuread_application" "github_oidc" {
  display_name = var.display_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_application_federated_identity_credential" "this" {
  application_id = azuread_application.github_oidc.id
  display_name   = var.display_name
  audiences      = ["api://AzureADTokenExchange"]
  issuer         = "https://token.actions.githubusercontent.com"
  subject        = "repo:${var.github_org}/${var.github_repo}:*"
  description    = var.description
}

data "azuread_service_principal" "sp" {
  client_id = azuread_application.github_oidc.client_id
}

resource "azurerm_role_assignment" "this" {
  scope                = var.role_scope
  role_definition_name = var.role_name
  principal_id         = data.azuread_service_principal.sp.object_id
}
