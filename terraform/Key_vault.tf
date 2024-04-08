module "azure_keyvault" {
  source  = "app.terraform.io/rohityad/azure_keyvault/azurerm"
  version = "1.0.0"

  costcenter          = var.COSTCENTER
  department          = var.DEPARTMENT
  env                 = var.ENV
  location            = data.azurerm_location.current.display_name
  owner               = var.OWNER
  application         = var.PROJECT
  resource_group_name = module.bluepi.rg_name
  keyvault_hsm_name   = "KEYVAULT-HSM-${var.PROJECT}-${var.ENV}"
  keyvault_name       = "KEYVAULT-${var.PROJECT}-${var.ENV}"
}