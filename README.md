# <REPLACE WITH USEFUL TERRAFORM DESCRIPTION>

[![Terraform CI](./actions/workflows/continuous-integration-terraform.yml/badge.svg?branch=main)](./actions/workflows/continuous-integration-terraform.yml?branch=main)
[![GitHub release](https://img.shields.io/github/release/<ORG>/<REPO>.svg)](./releases)

This <module/project> creates and manages <REPLACE WITH MAIN RESOURCE NAMES/URLS>.

## Usage

Example module usage:

```hcl
module "<MODULE NAME>" {
  source  = "github.com/<ORG>/<MODULE NAME>?ref=v<VERSION>"

  environment = "dev/staging/test/pre-prod/prod/post-prod"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.7.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.76.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.98.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.data_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_key.data_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_private_dns_a_record.keyvault_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_a_record) | resource |
| [azurerm_private_dns_zone.keyvault_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.key_vault_private_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_private_endpoint.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) | resource |
| [azurerm_role_assignment.key_user_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.key_vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |
| [azurerm_key_vault.data_protection](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_protection_azure_location"></a> [data\_protection\_azure\_location](#input\_data\_protection\_azure\_location) | Azure Region to deploy resources into | `string` | n/a | yes |
| <a name="input_data_protection_container_identity_principal_id"></a> [data\_protection\_container\_identity\_principal\_id](#input\_data\_protection\_container\_identity\_principal\_id) | The Principal ID of an Identity attached to the Container App | `string` | `""` | no |
| <a name="input_data_protection_existing_key_vault"></a> [data\_protection\_existing\_key\_vault](#input\_data\_protection\_existing\_key\_vault) | Conditionally launch resources into an existing Key Vault. Specifying this will NOT create a Key Vault. | `string` | `""` | no |
| <a name="input_data_protection_key_vault_access_ipv4"></a> [data\_protection\_key\_vault\_access\_ipv4](#input\_data\_protection\_key\_vault\_access\_ipv4) | List of IPv4 Addresses that are permitted to access the Data Protection Key Vault | `list(string)` | `[]` | no |
| <a name="input_data_protection_key_vault_assign_role"></a> [data\_protection\_key\_vault\_assign\_role](#input\_data\_protection\_key\_vault\_assign\_role) | Assign the Key Vault Key role to an Identity? | `bool` | `true` | no |
| <a name="input_data_protection_key_vault_subnet_prefix"></a> [data\_protection\_key\_vault\_subnet\_prefix](#input\_data\_protection\_key\_vault\_subnet\_prefix) | Subnet range that you want to register Private Endpoints into | `string` | n/a | yes |
| <a name="input_data_protection_resource_group_name"></a> [data\_protection\_resource\_group\_name](#input\_data\_protection\_resource\_group\_name) | Name of an existing Resource Group to deploy resources into | `string` | n/a | yes |
| <a name="input_data_protection_resource_prefix"></a> [data\_protection\_resource\_prefix](#input\_data\_protection\_resource\_prefix) | Prefix to add to all deployed resources | `string` | `""` | no |
| <a name="input_data_protection_tags"></a> [data\_protection\_tags](#input\_data\_protection\_tags) | Tags to be applied to all resources | `map(string)` | n/a | yes |
| <a name="input_data_protection_vnet_name"></a> [data\_protection\_vnet\_name](#input\_data\_protection\_vnet\_name) | Name of an existing Virtual Network to deploy the Key Vault Private Endpoint subnet into. Will default to: `[$resource_prefix]default` | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault"></a> [key\_vault](#output\_key\_vault) | n/a |
| <a name="output_key_vault_secret_key"></a> [key\_vault\_secret\_key](#output\_key\_vault\_secret\_key) | n/a |
<!-- END_TF_DOCS -->
