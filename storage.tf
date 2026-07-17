resource "azurerm_storage_account" "data_protection" {
  count = local.enable_storage ? 1 : 0

  name                             = "${replace(local.resource_prefix, "-", "")}dataprot"
  resource_group_name              = local.resource_group_name
  location                         = local.azure_location
  account_tier                     = "Standard"
  account_replication_type         = "LRS"
  min_tls_version                  = "TLS1_2"
  https_traffic_only_enabled       = true
  public_network_access_enabled    = true
  shared_access_key_enabled        = false
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false

  blob_properties {
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
  }
  tags = local.tags
}

resource "azurerm_storage_account_network_rules" "data_protection" {
  count = local.enable_storage ? 1 : 0

  storage_account_id         = azurerm_storage_account.data_protection[0].id
  default_action             = "Deny"
  bypass                     = ["AzureServices"]
  virtual_network_subnet_ids = local.storage_account_vnet_subnet_ids_allow_list
  ip_rules                   = local.storage_account_ipv4_allow_list
}

resource "azurerm_storage_container" "data_protection" {
  count = local.enable_storage ? 1 : 0

  name                 = "${local.resource_prefix}-data-prot"
  storage_account_name = azurerm_storage_account.data_protection[0].name
}
