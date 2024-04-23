resource "azurerm_eventgrid_topic" "this" {
  name                = "topic-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name = module.bluepi.rg_name
  location            = data.azurerm_location.current.display_name
  tags = {
  application         = "${var.PROJECT}-${var.ENV}"
  costcenter          = var.COSTCENTER
  department          = var.DEPARTMENT
  env                 = var.ENV
  owner               = var.OWNER
  }
}

resource "azurerm_storage_queue" "this" {
  name                  = "saqueue${var.project}df${var.env}"
  storage_account_name  = module.bluepi_storage.storage_name
 
}


#resource "azurerm_eventgrid_event_subscription" "this" {
 # name                   = "subscription-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
 # scope                  = module.bluepi_storage.storage_account_id
 # event_delivery_schema  = "EventGridSchema"
 # included_event_types    = ["BlobCreated"]
  
 # storage_queue_endpoint {
  #  storage_account_id = module.bluepi_storage.storage_account_id
  #  queue_name         = azurerm_storage_queue.this.name
 # }
#}