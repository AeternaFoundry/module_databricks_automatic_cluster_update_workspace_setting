resource "databricks_automatic_cluster_update_workspace_setting" "automatic_cluster_update_workspace_settings" {
  for_each = var.automatic_cluster_update_workspace_settings

  etag         = each.value.etag
  setting_name = each.value.setting_name

  automatic_cluster_update_workspace {
    can_toggle = each.value.automatic_cluster_update_workspace.can_toggle
    enabled    = each.value.automatic_cluster_update_workspace.enabled
    dynamic "maintenance_window" {
      for_each = each.value.automatic_cluster_update_workspace.maintenance_window != null ? [each.value.automatic_cluster_update_workspace.maintenance_window] : []
      content {
        dynamic "week_day_based_schedule" {
          for_each = maintenance_window.value.week_day_based_schedule != null ? [maintenance_window.value.week_day_based_schedule] : []
          content {
            day_of_week = week_day_based_schedule.value.day_of_week
            frequency   = week_day_based_schedule.value.frequency
            dynamic "window_start_time" {
              for_each = week_day_based_schedule.value.window_start_time != null ? [week_day_based_schedule.value.window_start_time] : []
              content {
                hours   = window_start_time.value.hours
                minutes = window_start_time.value.minutes
              }
            }
          }
        }
      }
    }
    restart_even_if_no_updates_available = each.value.automatic_cluster_update_workspace.restart_even_if_no_updates_available
  }

  dynamic "provider_config" {
    for_each = each.value.provider_config != null ? [each.value.provider_config] : []
    content {
      workspace_id = provider_config.value.workspace_id
    }
  }
}

