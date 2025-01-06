resource "azurerm_sql_server" "mytestterraform-sqlserver" {
  name                         = "mytestterraform-sqlserver"
  resource_group_name          = "Terraform-RG"
  location                     = "East US"
  version                      = "12.0"
  administrator_login          = "adminlogin"
  administrator_login_password = "AdminP@ssword123"
}

resource "azurerm_sql_database" "mytestterraform-database" {
  name                = "mytestterraform-database"
  resource_group_name = "Terraform-RG"
  location            = "East US"
  server_name         = azurerm_sql_server.mytestterraform-sqlserver.name
  edition             = "Basic"
  requested_service_objective_name = "Basic"
}
