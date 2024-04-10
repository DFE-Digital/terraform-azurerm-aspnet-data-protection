locals {
  resource_prefix                 = var.data_protection_resource_prefix # "${local.environment}${local.project_name}"
  existing_key_vault              = var.data_protection_existing_key_vault
  key_vault                       = local.existing_key_vault == "" ? azurerm_key_vault.data_protection[0] : data.azurerm_key_vault.data_protection[0]
  assign_rbac_role                = var.data_protection_key_vault_assign_role
  container_identity_principal_id = var.data_protection_container_identity_principal_id
  subnet_prefix                   = var.data_protection_key_vault_subnet_prefix
  key_vault_access_ipv4           = var.data_protection_key_vault_access_ipv4
  resource_group_name             = var.data_protection_resource_group_name # module.azure_container_apps_hosting.azurerm_resource_group_default.name
  vnet_name                       = var.data_protection_vnet_name == "" ? "${local.resource_prefix}default" : var.data_protection_vnet_name
  azure_location                  = var.data_protection_azure_location
  tags                            = var.data_protection_tags
}
