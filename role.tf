resource "azurerm_role_assignment" "key_user_role" {
  count = local.assign_rbac_role && local.container_identity_principal_id != "" ? 1 : 0

  scope                = local.key_vault.id
  role_definition_name = "Key Vault Crypto Secret Encryption User"
  principal_id         = local.container_identity_principal_id
  description          = "Allow Azure Container Apps to use the Keys defined inside Key Vault"
}
