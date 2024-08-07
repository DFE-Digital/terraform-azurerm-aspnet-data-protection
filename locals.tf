locals {
  resource_prefix                 = var.data_protection_resource_prefix
  existing_key_vault              = var.data_protection_existing_key_vault
  key_vault                       = local.existing_key_vault == "" ? azurerm_key_vault.data_protection[0] : data.azurerm_key_vault.data_protection[0]
  assign_rbac_role                = var.data_protection_key_vault_assign_role
  container_identity_principal_id = var.data_protection_container_identity_principal_id
  subnet_prefix                   = var.data_protection_key_vault_subnet_prefix
  key_vault_access_ipv4           = var.data_protection_key_vault_access_ipv4
  resource_group_name             = var.data_protection_resource_group_name
  vnet_name                       = var.data_protection_vnet_name == "" ? "${local.resource_prefix}default" : var.data_protection_vnet_name
  azure_location                  = var.data_protection_azure_location
  key_expiry_years                = var.data_protection_key_expiry_years
  timestamp_parts                 = regex("^(?P<year>\\d+)(?P<remainder>-.*)$", timestamp())
  year_from_now                   = format("%d%s", local.timestamp_parts.year + local.key_expiry_years, local.timestamp_parts.remainder)
  tags                            = var.data_protection_tags
  enable_diagnostic_setting       = var.data_protection_enable_diagnostic_setting
  enable_log_analytics_workspace  = var.data_protection_diagnostic_log_analytics_workspace_id == "" ? var.data_protection_enable_log_analytics_workspace : false
  diagnostic_log_analytics_workspace_id = var.data_protection_diagnostic_log_analytics_workspace_id != "" ? var.data_protection_diagnostic_log_analytics_workspace_id : (
    local.enable_log_analytics_workspace ? azurerm_log_analytics_workspace.key_vault[0].id : null
  )
}
