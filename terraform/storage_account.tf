 module "bluepi_storage" {
  source  = "app.terraform.io/rohityad/azure_storage/azurerm"
  version = "1.0.8"

  account_kind                    = "StorageV2"
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
  application                     = "${var.PROJECT}-${var.ENV}"
  costcenter                      = var.COSTCENTER
  department                      = var.DEPARTMENT
  env                             = var.ENV
  location                        = data.azurerm_location.current.display_name
  owner                           = var.OWNER
  rgname                          = module.bluepi.rg_name
  storage_account_name            = "sa${var.project}df${var.env}"
  hns_enabled                   = true
  public_network_access_enabled = true
  allow_nested_items_to_be_public = true
  
  storage_blob_data_protection = {
    versioning_enabled = false
  }

}