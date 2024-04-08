module "azure_networking" {
  source  = "app.terraform.io/rohityad/azure_networking/azurerm"
  version = "1.0.28" 

  vnet_name          = "VNET-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  vnet_address_space = [var.NETWORK_CIDR]
  department         = var.DEPARTMENT
  project            = var.PROJECT
  env                = var.ENV
  application        = var.PROJECT
  costcenter         = var.COSTCENTER
  owner              = var.OWNER

  subnets = {
    App1 = var.APP_SUBNET_CIDR
    PE1  = var.PRIVATE_ENDPOINT_SUBNET_CIDR
  }
}