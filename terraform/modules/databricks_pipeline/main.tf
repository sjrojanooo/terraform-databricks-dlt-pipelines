terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.48.0"
    }
  }
  required_version = "~> 1.8.5"
}