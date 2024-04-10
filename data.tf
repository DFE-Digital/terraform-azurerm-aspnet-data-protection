data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "data_protection" {
  count = local.existing_key_vault == "" ? 0 : 1

  name                = local.existing_key_vault
  resource_group_name = local.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = local.vnet_name
  resource_group_name = local.resource_group_name
}
