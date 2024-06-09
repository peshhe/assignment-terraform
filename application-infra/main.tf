# ----------------------------------------------------------------
# Supporting Resources for the Web App
# ----------------------------------------------------------------

# Create Resource Group for IAM Purposes (Service Principal)
resource "azurerm_resource_group" "rg-iam" {
  name     = var.rg_iam
  location = var.region

  tags = local.common_tags
}

# Creating an application for the Service Principal
resource "azuread_application" "ad-app" {
  display_name = var.sp_name
}

# Creating the Service Principal
resource "azuread_service_principal" "principal1" {
  client_id   = azuread_application.ad-app.client_id
  description = "Service Principal for pushing to the Azure Container Registry"
}

# Creating the Service Principal password
resource "azuread_service_principal_password" "principal1-pass" {
  service_principal_id = azuread_service_principal.principal1.object_id
  display_name         = "Password for Service Principal '${var.sp_name}'"
}

# Assign a "Contributor" role of the Service Principal to the application Resource Group
resource "azurerm_role_assignment" "contributor" {
  scope                = azurerm_resource_group.rg-app.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.principal1.object_id
}

# Assign a "AcrPush" role of the Service Principal to the Azure Container Registry
resource "azurerm_role_assignment" "acr_push" {
  scope                = azurerm_container_registry.acr1.id
  role_definition_name = "AcrPush"
  principal_id         = azuread_service_principal.principal1.object_id
}


# Create a JSON file, containing Azure login credentials
data "azurerm_client_config" "client-config" {}

resource "local_file" "sdk_auth" {
  content = jsonencode({
    clientId                       = azuread_service_principal.principal1.client_id
    clientSecret                   = azuread_service_principal_password.principal1-pass.value
    subscriptionId                 = data.azurerm_client_config.client-config.subscription_id
    tenantId                       = data.azurerm_client_config.client-config.tenant_id
    activeDirectoryEndpointUrl     = "https://login.microsoftonline.com"
    resourceManagerEndpointUrl     = "https://management.azure.com/"
    activeDirectoryGraphResourceId = "https://graph.windows.net/"
    sqlManagementEndpointUrl       = "https://management.core.windows.net:8443/"
    galleryEndpointUrl             = "https://gallery.azure.com/"
    managementEndpointUrl          = "https://management.core.windows.net/"
  })
  filename = "${path.module}/sdk-auth.json"
}
