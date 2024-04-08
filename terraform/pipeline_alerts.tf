resource "azurerm_monitor_metric_alert" "pipeline_failure_alert" {
  name                 = "pipeline_failure_alert-${var.project}-${var.env}"
  resource_group_name  = module.bluepi.rg_name
  scopes               = [module.bluepi_data_factory.data_factory_id]
  #evaluation_frequency = "Minute"
  frequency            = "PT1M" 
  severity             = "3" 

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories/pipelines"
    metric_name      = "PipelineRunsFailed"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = module.action_group_id.id
  }
}

