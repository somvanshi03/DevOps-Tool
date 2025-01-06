resource "azurerm_service_plan" "companyplan" {
  name                = "companyplan"
  resource_group_name = "Terraform-RG"
  location            = "West US"
  os_type             = "Windows"
  sku_name            = "B1"
  depends_on = [
    azurerm_resource_group.Terraform-RG
  ]
}

resource "azurerm_windows_web_app" "devopshanogutwebapp1001" {
  name                = "devopshanogutwebapp1001"
  resource_group_name = "Terraform-RG"
  location            = "West US"
  service_plan_id     = azurerm_service_plan.companyplan.id

  site_config {
    application_stack {
      current_stack  = "dotnetcore"
      dotnet_version = "v8.0"
    }
  }

  depends_on = [
    azurerm_service_plan.companyplan
  ]
}