variable "data_protection_existing_key_vault" {
  description = "Conditionally launch resources into an existing Key Vault. Specifying this will NOT create a Key Vault."
  type        = string
  default     = ""
}

variable "data_protection_container_identity_principal_id" {
  description = "The Principal ID of an Identity attached to the Container App"
  type        = string
  default     = ""
}

variable "data_protection_key_vault_assign_role" {
  description = "Assign the Key Vault Key role to an Identity?"
  type        = bool
  default     = true
}

variable "data_protection_key_vault_subnet_prefix" {
  description = "Subnet range that you want to register Private Endpoints into"
  type        = string
}

variable "data_protection_key_vault_access_ipv4" {
  description = "List of IPv4 Addresses that are permitted to access the Data Protection Key Vault"
  type        = list(string)
  default     = []
}

variable "data_protection_resource_prefix" {
  description = "Prefix to add to all deployed resources"
  type        = string
  default     = ""
}

variable "data_protection_azure_location" {
  description = "Azure Region to deploy resources into"
  type        = string
}

variable "data_protection_tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "data_protection_resource_group_name" {
  description = "Name of an existing Resource Group to deploy resources into"
  type        = string
}

variable "data_protection_vnet_name" {
  description = "Name of an existing Virtual Network to deploy the Key Vault Private Endpoint subnet into. Will default to: `[$resource_prefix]default`"
  type        = string
  default     = ""
}

variable "data_protection_enable_diagnostic_setting" {
  description = "Turn on Audit Logs for Key Vault"
  type        = bool
  default     = true
}

variable "data_protection_enable_log_analytics_workspace" {
  description = "When enabled, creates a Log Analyics Workspace, if one hasn't been specified for `data_protection_diagnostic_log_analytics_workspace_id`"
  type        = bool
  default     = false
}

variable "data_protection_diagnostic_log_analytics_workspace_id" {
  description = "Specify a Log Analytics Workspace ID to send Diagnostic information to"
  type        = string
  default     = ""
}
