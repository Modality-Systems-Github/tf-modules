/*
 diagnostic setting
 ricardo.meechan@modalitysystems.com
*/

resource "azurerm_monitor_diagnostic_setting" "diagnostic_setting" {
  name                       = var.name
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.workspace
  //log_analytics_destination_type = "AzureDiagnostics"
  log_analytics_destination_type =  var.type

  dynamic "log" {
    for_each = var.logs
    content {
      category = log.value
      enabled  = true

      retention_policy {
        days = 0
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = var.metrics
    content {
      category = metric.value

      retention_policy {
        days = 0
        enabled = false
      }
    }
  }
}

