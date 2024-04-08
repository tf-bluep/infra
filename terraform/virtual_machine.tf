module "azure_vm_navi_ir1" {
  source  = "app.terraform.io/rohityad/azure_virtualmachine/azurerm"
  version = "1.0.33"

  OS           = "2022"
  application  = "EDHP-${var.ENV}"
  costcenter   = var.COSTCENTER
  datadisksize = "32"
  datadisktype = "Standard_LRS"
  department   = var.DEPARTMENT
  env          = var.ENV
  location     = data.azurerm_location.current.display_name
  os_disk_size = "128"
  os_disk_type = "Standard_LRS"
  owner        = var.OWNER
  rgname       = module.bluepi.rg_name
  size         = "Standard_D4as_v5"
  subnetname   = module.azure_networking.subnet_names[0]
  vNet         = module.azure_networking.vnet_name
  vmname       = "ZPW-${var.PROJECT}-${var.PREFIX}IRN1"
  vnetcidr     = tostring(module.azure_networking.vnet_cidr[0])
  vnetrg       = module.azure_networking.vnet_rgname
  os_password  = var.os_password
  domainpass   = var.domainpass
  domain       = "Yes"
}