resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "navitaire" {
  name                     = "adls-gen2-linked-service-navitaire-${var.PROJECT}-${var.ENV}01"
  data_factory_id          = module.bluepi_data_factory.data_factory_id
  storage_account_key      = module.bluepi_storage.storage_account_key
  url                      = "https://${module.bluepi_storage.primary_dfs_host}"
  integration_runtime_name = azurerm_data_factory_integration_runtime_self_hosted.Navitaire.name
}