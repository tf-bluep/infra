module "azure_diagnostics" {
  source  = "app.terraform.io/rohityad/azure_diagnostics/azurerm"
  version = "1.0.0"
  # insert required variables here

  diag_name             = "diag-${var.DEPARTMENT}-${var.PROJECT}-${var.ENV}"
  logs_destinations_ids = [
  "/subscriptions/f2fb6ada-1520-4d1a-a23b-8ebbcf63a24c/resourceGroups/my-resource-group/providers/Microsoft.Storage/storageAccounts/my-storage-account",
  "/subscriptions/f2fb6ada-1520-4d1a-a23b-8ebbcf63a24c/resourceGroups/my-resource-group/providers/Microsoft.OperationalInsights/workspaces/my-log-analytics-workspace",
  "/subscriptions/f2fb6ada-1520-4d1a-a23b-8ebbcf63a24c/resourceGroups/my-resource-group/providers/Microsoft.EventHub/namespaces/my-event-hub-namespace"
]
  resource_id           ="/subscriptions/f2fb6ada-1520-4d1a-a23b-8ebbcf63a24c/resourceGroups/RG-it-bluepi-dev/providers/Microsoft.Storage/storageAccounts/sabluepidfdev"

}