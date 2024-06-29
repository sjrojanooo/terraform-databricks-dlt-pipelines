terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    databricks = {
      source  = "databricks/databricks"
      version = ">= 1.48.0"
    }
  }
  # Where to store the Terraform state file
  # This can be stored in a S3 bucket. This allows multi user deployment and deployment pipelines via Azure Devops
  backend "s3" {
    bucket = "<S3_BUCKET>"
    key    = "<KEY_TO_STATE_FILE>" # S3 PREFIX
    region = "<REGION_HERE>"
  }
  # terraform version constraint on major and minor versions
  required_version = "~> 1.8.5"
}

provider "aws" {
  region = "<REGION_HERE>"
}

provider "databricks" {
  # https://registry.terraform.io/providers/databricks/databricks/latest/docs#authentication
  # profile = "<CONFIGURED_PROFILE>"
  # host = "<DATABRICKS_WORKSPACE_URL>"
  # token = "<DATABRICKS_TOKEN>"
}

locals {
  catalog       = "<PRODUCTION_CATALOG>"
  target_schema = "<PRODUCTION_SCHEMA>"
}