# terraform/terraform.tfvars

project_id            = "your-gcp-project-id"
region                = "us-central1"
zone                  = "us-central1-a"
environment_name      = "composer-etl-env"
service_account_email = "your-service-account@your-project.iam.gserviceaccount.com"
network               = "projects/your-project-id/global/networks/default"
subnetwork            = "projects/your-project-id/regions/us-central1/subnetworks/default"
