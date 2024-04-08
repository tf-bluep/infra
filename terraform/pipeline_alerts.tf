resource "azurerm_monitor_metric_alert" "pipeline_failure_alert" {
  name                 = "pipeline_failure_alert-${var.project}-${var.env}"
  resource_group_name  = module.prism.rg_name
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
    action_group_id = azurerm_monitor_action_group.this.id
  }
}
