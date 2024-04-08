module "azure_containers" {
  source  = ""app.terraform.io/rohityad/azure_containers/azurerm""
  version = "1.0.0"

  container_names      = ["edh-data-${var.env}"]
  storage_account_name = module.bluepi_storage.storage_name
}