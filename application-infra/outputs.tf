# Login server name for the Azure Container Registry (REGISTRY_LOGIN_SERVER)
output "acr1_fqdn" {
  value = azurerm_container_registry.acr1.login_server
}

# clientID of the Service Principal (REGISTRY_USERNAME)
output "client_id" {
  value     = azuread_service_principal.principal1.client_id
  sensitive = true
}

# clientSecret (password) of the Service Principal (REGISTRY_PASSWORD)
output "client_secret" {
  value     = azuread_service_principal_password.principal1-pass.value
  sensitive = true
}

# The name of the Resource Group that the Service Principal has roles assigned to
output "rg_app_name" {
  value = azurerm_resource_group.rg-app.name
}

# Tenant ID
output "tenant_id" {
  value     = data.azurerm_client_config.client-config.tenant_id
  sensitive = true
}

# Subscription ID
output "subscription_id" {
  value     = data.azurerm_client_config.client-config.subscription_id
  sensitive = true
}

# JSON file containing Azure login credentials
output "sdk_auth_file" {
  value = local_file.sdk_auth.filename
}

# FQDN of the PostgreSQL Database server
output "postgresql_server_fqdn" {
  value = azurerm_postgresql_server.postgre-server.fqdn
}
