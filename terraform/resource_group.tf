module "bluepi" {
  source  = "app.terraform.io/rohityad/azure_resourcegroup/azurerm"
  version = "1.0.33"


  application = "${var.PROJECT}-${var.ENV}"
  costcenter  = var.COSTCENTER
  department  = var.DEPARTMENT
  env         = var.ENV
  location    = data.azurerm_location.current.display_name
  owner       = var.OWNER
  rgname      = "RG-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"

}