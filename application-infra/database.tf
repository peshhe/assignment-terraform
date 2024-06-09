# Creating the PostgreSQL Server
resource "azurerm_postgresql_server" "postgre-server" {
  name                = var.db_postgre_server_name
  location            = var.region
  resource_group_name = var.rg_app

  sku_name = "B_Gen5_1" # tier + family + cores

  version                 = "9.6" # old, but works
  ssl_enforcement_enabled = true
  storage_mb              = 5120 # Equals to 5GB

  administrator_login          = var.db_username
  administrator_login_password = var.db_password

  tags = local.common_tags

  depends_on = [azurerm_resource_group.rg-app]
}

# Creating the PostgreSQL Database
resource "azurerm_postgresql_database" "postgre-db" {
  name                = var.db_postgre_db_name
  resource_group_name = var.rg_app
  server_name         = var.db_postgre_server_name
  charset             = "UTF8"
  collation           = "English_United States.1252"

  depends_on = [azurerm_postgresql_server.postgre-server]

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }

}

# Creating a Firewall rule to allow all Azure services to access my PostgreSQL Server
resource "azurerm_postgresql_firewall_rule" "allow_azure_services" {
  name                = var.fw_rule_name
  resource_group_name = var.rg_app
  server_name         = var.db_postgre_server_name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"

  depends_on = [azurerm_postgresql_server.postgre-server]
}
