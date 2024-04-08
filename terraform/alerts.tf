data "azurerm_storage_account" "storage" {
  name                     = module.bluepi_storage.storage_name
  resource_group_name      = module.bluepi.rg_name
}

resource "azurerm_monitor_action_group" "ActionGroupDemo" {
  name                = "ActionGroupDemo-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  short_name          = "exactiongrp"
  email_receiver {
    name          = "email"
    email_address = "rohit.yadav@bluepi.in"
  }
}

resource "azurerm_monitor_metric_alert" "storage_account_alert" {
  name                = "storage-account-capacity-alert-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  scopes              = [data.azurerm_storage_account.storage.id]

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 1
  }

  action {
    action_group_id = azurerm_monitor_action_group.ActionGroupDemo.id
  }

  description = "Alert triggered when Used capacity exceeds 1%"
  window_size       = "PT1H"
}
resource "azurerm_monitor_metric_alert" "pipeline_failure_alert" {
  name                 = "pipeline_failure_alert-${var.project}-${var.env}"
  resource_group_name  = module.bluepi.rg_name
  scopes               = module.prism_data_factory.data_factory_id
  evaluation_frequency = "Minute"
  frequency            = 2 
  severity             = "5" 

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories/pipelines"
    metric_name      = "PipelineRunsFailed"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }
  action {
    action_group_id = azurerm_monitor_action_group.ActionGroupDemo.id
  }
