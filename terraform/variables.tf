# terraform/variables.tf

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region to deploy Composer"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone for Composer node configuration"
  type        = string
  default     = "us-central1-a"
}

variable "environment_name" {
  description = "Name of the Composer environment"
  type        = string
}

variable "service_account_email" {
  description = "Service account email for Composer environment"
  type        = string
}

variable "network" {
  description = "VPC network name (full path or self-link)"
  type        = string
}

variable "subnetwork" {
  description = "Subnetwork name (full path or self-link)"
  type        = string
}
