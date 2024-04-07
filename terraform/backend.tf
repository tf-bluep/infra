terraform {

  cloud {
    organization = "rohityad"
    workspaces {
      name = "infra"
    }
  }
}

provider "azurerm" {
  features {}
}