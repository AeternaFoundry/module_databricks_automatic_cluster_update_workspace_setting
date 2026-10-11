variable "automatic_cluster_update_workspace_settings" {
  description = <<EOT
Map of automatic_cluster_update_workspace_settings, attributes below
Required:
    - automatic_cluster_update_workspace (block):
        - can_toggle (optional)
        - enabled (required)
        - maintenance_window (optional, block):
            - week_day_based_schedule (optional, block):
                - day_of_week (required)
                - frequency (required)
                - window_start_time (optional, block):
                    - hours (required)
                    - minutes (required)
        - restart_even_if_no_updates_available (optional)
Optional:
    - etag
    - setting_name
    - provider_config (block):
        - workspace_id (optional)
EOT

  type = map(object({
    etag         = optional(string)
    setting_name = optional(string)
    automatic_cluster_update_workspace = object({
      can_toggle = optional(bool)
      enabled    = bool
      maintenance_window = optional(object({
        week_day_based_schedule = optional(object({
          day_of_week = string
          frequency   = string
          window_start_time = optional(object({
            hours   = number
            minutes = number
          }))
        }))
      }))
      restart_even_if_no_updates_available = optional(bool)
    })
    provider_config = optional(object({
      workspace_id = optional(string)
    }))
  }))
}

