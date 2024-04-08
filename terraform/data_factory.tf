module "bluepi_data_factory" {
  source  = "app.terraform.io/rohityad/azure_datafactory/azurerm"
  version = "1.0.25"

  application         = "bluepi-${var.ENV}"
  costcenter          = var.COSTCENTER
  department          = var.DEPARTMENT
  owner               = var.OWNER
  env                 = var.ENV
  project_name        = var.PROJECT
  resource_group_name = module.bluepi.rg_name
  data_factory_name   = "DF-${var.PROJECT}-${var.ENV}01"
  location            = data.azurerm_location.current.display_name
  github_configuration = {

    account_name    = "tf-bluep"
    branch_name     = "main"
    git_url         = "https://github.com/"
    repository_name = "tf-infra"
    root_folder     = "/"
  }
  integration_runtime_type        = "Azure"
  integration_runtime_custom_name = "WebAnalytics-${var.PREFIX}SHIR-01"

}
resource "azurerm_data_factory_integration_runtime_self_hosted" "Navitaire" {

  data_factory_id = module.bluepi_data_factory.data_factory_id
  name            = "Navitaire-${var.PREFIX}SHIR-01"
  description     = "Navitaire Self Hosted Runtime"
}