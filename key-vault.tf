resource "azurerm_key_vault" "data_protection" {
  count = local.existing_key_vault == "" ? 1 : 0

  name                       = "${local.resource_prefix}-dpkv"
  location                   = local.azure_location
  resource_group_name        = local.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  enable_rbac_authorization  = true
  purge_protection_enabled   = true

  network_acls {
    bypass                     = "None"
    default_action             = "Deny"
    virtual_network_subnet_ids = []
    ip_rules                   = length(local.key_vault_access_ipv4) > 0 ? local.key_vault_access_ipv4 : null
  }

  tags = local.tags
}

resource "azurerm_key_vault_key" "data_protection" {
  name         = "${local.resource_prefix}-dp-key"
  key_vault_id = local.key_vault.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }

  tags = local.tags
}
