output "primary_dfs_host" {
  value = "<your_primary_dfs_host_value>"
}

output "action_group_id" {
  value = module.azure_actiongroup.action_group.id  
}