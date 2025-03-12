resource "azurerm_container_app" "containerapp" {
  name                         = var.container_apps_sample_app_name
  container_app_environment_id = azurerm_container_app_environment.environment.id
  resource_group_name          = azurerm_resource_group.example.name
  revision_mode                = "Multiple"

  template {
    container {
      name   = "adoagent"
      image  = "locals things"
      cpu    = 0.5
      memory = "1Gi"

      volume_mounts {
        name = "azure-files-volume"
        path = "/app/images"
      }
    }

    volume {
      name         = "azure-files-volume"
      storage_type = "AzureFile"
      storage_name = azurerm_container_app_environment_storage.env_storage.name
    }

    min_replicas = 0
    max_replicas = 5
  }


}
