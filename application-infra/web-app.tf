# Create the Resource Group for the Application
resource "azurerm_resource_group" "rg-app" {
  name     = var.rg_app
  location = var.region

  tags = local.common_tags
}

# Create the Container Registry
resource "azurerm_container_registry" "acr1" {
  name                = var.acr_name
  resource_group_name = var.rg_app
  location            = var.region
  sku                 = "Basic"

  tags = local.common_tags
}
