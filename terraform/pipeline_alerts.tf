data "azurerm_data_factory" "pipeline" {
  name                     = module.bluepi_data_factory.data_factory_name
  resource_group_name      = module.bluepi.rg_name
}

resource "azurerm_monitor_metric_alert" "pipeline_failure_alert" {
  name                 = "pipeline_failure_alert-${var.project}-${var.env}"
  resource_group_name  = module.bluepi.rg_name
  scopes               = [data.azurerm_data_factory.pipeline.id]
  #evaluation_frequency = "Minute"
  frequency            = "PT1M" 
  severity             = "3" 

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "Failed_Pipeline_Runs_Metrics"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = module.azure_actiongroup.action_group_id
  }
}

