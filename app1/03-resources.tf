# Create naming convetion rule: [environment]-[resource_type]-[app_name]-[padding]
resource "azurecaf_naming_convention" "names" {  
  for_each      = toset(var.service_name)
  resource_type = each.value
  name          = var.app_name
  prefix        = var.environment
  max_length    = var.max_length_name
  convention    = var.convention_method
}

resource "azurerm_resource_group" "main" {
  name     = azurecaf_naming_convention.names["azurerm_resource_group"].result
  location = var.location
}

resource "azurerm_application_insights" "app1" {
  name                = azurecaf_naming_convention.names["azurerm_application_insights"].result
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  application_type    = var.appi_type
}

resource "azurerm_service_plan" "app1" {
  name                = azurecaf_naming_convention.names["azurerm_app_service_plan"].result
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  os_type             = var.plan_platform
  sku_name            = var.plan_sku
}

resource "azurerm_linux_web_app" "app1" {
  name                = azurecaf_naming_convention.names["azurerm_app_service"].result
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_service_plan.app1.location
  service_plan_id     = azurerm_service_plan.app1.id
  site_config {}
  app_settings  = {
    "APPINSIGHTS_INSTRUMENTATIONKEY"        = azurerm_application_insights.app1.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.app1.connection_string
  }

  depends_on = [azurerm_application_insights.app1]
}

resource "azurerm_storage_account" "app1" {
  name                     = azurecaf_naming_convention.names["azurerm_storage_account"].result
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = var.st_tier
  account_replication_type = var.st_replication
}