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
  storage_account_name  = module.bluepi.rg_name
 
}

#resource "azurerm_eventgrid_event_subscription" "example" {
 # name                   = "subscription-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
 # scope                  = azurerm_eventgrid_topic.this.id
 # event_delivery_schema  = "EventGridSchema"
 # endpoint_type          = "WebHook"
 # endpoint_url           = "https://your-webhook-url"
 # included_event_types   = ["All"]
#}