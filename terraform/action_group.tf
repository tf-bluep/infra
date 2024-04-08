module "azure_actiongroup" {
  source  = "app.terraform.io/rohityad/azure_actiongroup/azurerm"
  version = "1.0.1"
  
  action_group_name    = "ActionGroupDemo-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  resource_group_name  = module.bluepi.rg_name
  application          = "${var.PROJECT}-${var.ENV}"
  costcenter           = var.COSTCENTER
  department           = var.DEPARTMENT
  env                  = var.ENV
  owner                = var.OWNER
  email_address        = "rohit.yadav@bluepi.in"
  short_name           = "exactiongrp"
}