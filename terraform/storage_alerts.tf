data "azurerm_storage_account" "storage" {
  name                     = module.bluepi_storage.storage_name
  resource_group_name      = module.bluepi.rg_name
}

resource "azurerm_monitor_metric_alert" "storage_account_alert" {
  name                = "storage-account-capacity-alert-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  scopes              = [data.azurerm_storage_account.storage.id]

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts/blobservices"
    metric_name      = "BlobCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = module.azure_actiongroup.action_group_id
  }

  description = "Alert triggered when Used capacity exceeds 1%"
  window_size       = "PT1H"
}