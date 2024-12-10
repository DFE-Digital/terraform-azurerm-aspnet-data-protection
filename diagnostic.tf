resource "azurerm_monitor_diagnostic_setting" "dpkv" {
  count = local.enable_diagnostic_setting ? 1 : 0

  name                       = "${local.resource_prefix}-dpkv-diag"
  target_resource_id         = local.key_vault.id
  log_analytics_workspace_id = local.diagnostic_log_analytics_workspace_id

  enabled_log {
    category = "AuditEvent"
  }

  metric {
    category = "AllMetrics"
    enabled  = false
  }
}
