resource "azurerm_log_analytics_workspace" "key_vault" {
  count = local.enable_log_analytics_workspace ? 1 : 0

  name                = "${local.resource_prefix}dpkvlogs"
  resource_group_name = local.resource_group_name
  location            = local.azure_location
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}
