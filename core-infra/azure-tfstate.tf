# Create the Resource Group for the Terraform State
resource "azurerm_resource_group" "rg-tfstate" {
  name     = var.rg_tfstate
  location = var.region

  tags = local.common_tags
}

# Create the Storage Account for the Terraform State
resource "azurerm_storage_account" "sa-tfstate" {
  name                     = var.sa_tfstate
  resource_group_name      = var.rg_tfstate
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS" # Locally Redundant Storage, can be GRS (Geo-Redundant Storage)

  tags = local.common_tags

  depends_on = [ azurerm_resource_group.rg-tfstate ]
}

# Create the Storage Container for the Terraform State
resource "azurerm_storage_container" "sc-tfstate" {
  name                  = var.sc_tfstate
  storage_account_name  = var.sa_tfstate
  container_access_type = "private"

  depends_on = [ azurerm_storage_account.sa-tfstate ]
}
