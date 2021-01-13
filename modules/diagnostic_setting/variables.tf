variable "name" {
  description = "Name for the diagnostic setting"
  type = string
  default = "modality-sbd-default"
}

variable "target_resource_id" {
  description = "The ID of the resource to apply the diagnostic setting to."
  type = string
}

variable "workspace" {
  description = "ID of the workspace"
  type = string
  #default = azurerm_log_analytics_workspace.la_workspace.id
}

variable "logs" {
  description = "List of logs"
  type = list(string)
}

variable "metrics" {
  description = "List of metrics"
  type = list(string)
}

variable "type" {
  description = "Type of logs"
  type = string
  default = null
}


