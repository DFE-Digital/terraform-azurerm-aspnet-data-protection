resource "azurerm_subnet" "key_vault" {
  name                 = "${local.resource_prefix}-dpkvprivateendpoint"
  virtual_network_name = local.vnet_name
  resource_group_name  = local.resource_group_name
  address_prefixes     = [local.subnet_prefix]

  service_endpoints = [
    "Microsoft.KeyVault",
  ]
}

resource "azurerm_private_dns_zone" "keyvault_dns" {
  name                = "${azurerm_key_vault.data_protection.name}.vault.azure.net"
  resource_group_name = local.resource_group_name
  tags                = local.tags
}

resource "azurerm_private_dns_a_record" "keyvault_dns" {
  name                = "@"
  zone_name           = azurerm_private_dns_zone.keyvault_dns.name
  resource_group_name = local.resource_group_name
  ttl                 = 300
  records             = [azurerm_private_endpoint.key_vault.private_service_connection[0].private_ip_address]
  tags                = local.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault_private_link" {
  name                  = "${local.resource_prefix}-kv-private-link"
  resource_group_name   = local.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.keyvault_dns.name
  virtual_network_id    = module.azure_container_apps_hosting.networking.vnet_id
  tags                  = local.tags
}

resource "azurerm_private_endpoint" "key_vault" {
  name                = "${local.resource_prefix}dpkv"
  location            = module.azure_container_apps_hosting.azurerm_resource_group_default.location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.key_vault.id

  private_service_connection {
    name                           = "${local.resource_prefix}keyvaultconnection"
    private_connection_resource_id = local.key_vault.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  tags = local.tags
}
