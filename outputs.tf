output "key_vault" {
  value = local.key_vault
}

output "key_vault_secret_key" {
  value = azurerm_key_vault_key.data_protection
}
