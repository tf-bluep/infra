data "azurerm_storage_account" "storage" {
  name                     = module.bluepi_storage.storage_name
  resource_group_name      = module.bluepi.rg_name
}

resource "azurerm_monitor_metric_alert" "blob_storage_egress_alert" {
  name                = "blob-storage-account-egress-alert-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  scopes              = [data.azurerm_storage_account.storage.id]

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Egress"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 500
  }

  action {
    action_group_id = module.azure_actiongroup.action_group_id
  }

  description = "Alert triggered when Used capacity exceeds 1%"
  window_size       = "PT1H"
}

resource "azurerm_monitor_metric_alert" "blob_storage_Availability_alert" {
  name                = "blob-storage-account-Availability-alert-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  scopes              = [data.azurerm_storage_account.storage.id]

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Availability"
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

resource "azurerm_monitor_metric_alert" "blob_storage_transactions_alert" {
  name                = "blob-storage-account-transactions-alert-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  scopes              = [data.azurerm_storage_account.storage.id]

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Transactions"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = module.azure_actiongroup.action_group_id
  }

  description = "Alert triggered when Used capacity exceeds 1%"
  window_size       = "PT1H"
}