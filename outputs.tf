output "automatic_cluster_update_workspace_settings_id" {
  description = "Map of id values across all automatic_cluster_update_workspace_settings, keyed the same as var.automatic_cluster_update_workspace_settings except keys with no id are omitted"
  value       = { for k, v in databricks_automatic_cluster_update_workspace_setting.automatic_cluster_update_workspace_settings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "automatic_cluster_update_workspace_settings_automatic_cluster_update_workspace" {
  description = "Map of automatic_cluster_update_workspace values across all automatic_cluster_update_workspace_settings, keyed the same as var.automatic_cluster_update_workspace_settings except keys with no automatic_cluster_update_workspace are omitted"
  value       = { for k, v in databricks_automatic_cluster_update_workspace_setting.automatic_cluster_update_workspace_settings : k => one(v.automatic_cluster_update_workspace) if v.automatic_cluster_update_workspace != null && length(v.automatic_cluster_update_workspace) > 0 }
}
output "automatic_cluster_update_workspace_settings_etag" {
  description = "Map of etag values across all automatic_cluster_update_workspace_settings, keyed the same as var.automatic_cluster_update_workspace_settings except keys with no etag are omitted"
  value       = { for k, v in databricks_automatic_cluster_update_workspace_setting.automatic_cluster_update_workspace_settings : k => v.etag if v.etag != null && length(v.etag) > 0 }
}
output "automatic_cluster_update_workspace_settings_provider_config" {
  description = "Map of provider_config values across all automatic_cluster_update_workspace_settings, keyed the same as var.automatic_cluster_update_workspace_settings except keys with no provider_config are omitted"
  value       = { for k, v in databricks_automatic_cluster_update_workspace_setting.automatic_cluster_update_workspace_settings : k => one(v.provider_config) if v.provider_config != null && length(v.provider_config) > 0 }
}
output "automatic_cluster_update_workspace_settings_setting_name" {
  description = "Map of setting_name values across all automatic_cluster_update_workspace_settings, keyed the same as var.automatic_cluster_update_workspace_settings except keys with no setting_name are omitted"
  value       = { for k, v in databricks_automatic_cluster_update_workspace_setting.automatic_cluster_update_workspace_settings : k => v.setting_name if v.setting_name != null && length(v.setting_name) > 0 }
}

