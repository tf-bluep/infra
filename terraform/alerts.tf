data "azurerm_storage_account" "storage" {
  name                     = module.bluepi_storage.storage_name
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
  scopes              = [module.bluepi_storage.storage_name]

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