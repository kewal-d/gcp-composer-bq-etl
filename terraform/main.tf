# terraform/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_composer_environment" "composer_env" {
  name   = var.environment_name
  region = var.region

  config {
    software_config {
      image_version = "composer-2.4.5-airflow-2.6.3"
      python_version = "3"
      env_variables = {
        AIRFLOW_VAR_SAMPLE_KEY = "sample_value"
      }
    }

    node_config {
      location         = var.zone
      machine_type     = "e2-medium"
      service_account  = var.service_account_email
      network          = var.network
      subnetwork       = var.subnetwork
    }

    workloads_config {
      scheduler {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 1
      }

      web_server {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 1
      }

      worker {
        cpu        = 1
        memory_gb  = 2
        storage_gb = 1
      }
    }
  }

  labels = {
    env = "dev"
  }
}
