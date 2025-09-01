output "service_principal" {
  value       = data.azuread_service_principal.sp
  description = "Service principal object associated with the application."
}

output "azuread_application" {
  value       = azuread_application.github_oidc
  description = "Application object associated with the service principal."
}
