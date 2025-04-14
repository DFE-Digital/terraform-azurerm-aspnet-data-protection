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

resource "time_static" "key_expiration_date" {
  triggers = {
    # Save the time when Key Vault is built
    key_vault_id = local.key_vault.id
  }
}
