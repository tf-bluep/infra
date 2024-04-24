resource "azurerm_storage_queue" "this" {
  name                 = "saqueue${var.project}df${var.env}"
  storage_account_name = module.bluepi_storage.storage_name
}

resource "azurerm_eventgrid_system_topic" "this" {
  name                   = "topic-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  location               = data.azurerm_location.current.display_name
  resource_group_name    = module.bluepi.rg_name
  source_arm_resource_id = module.bluepi.rg_name_id
  topic_type             = "Microsoft.Resources.ResourceGroups"
}

resource "azurerm_eventgrid_system_topic_event_subscription" "this" {
  name                   = "subscription-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  system_topic           = azurerm_eventgrid_system_topic.this.name
  resource_group_name    = module.bluepi.rg_name
  event_delivery_schema  = "EventGridSchema"
  included_event_types   = ["BlobCreated"]

  storage_queue_endpoint {
    storage_account_id = module.bluepi_storage.storage_account_id
    queue_name         = azurerm_storage_queue.this.name
  }
}