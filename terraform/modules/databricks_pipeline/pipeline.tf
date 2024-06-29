locals {
  instance_profile_arn = "<DATABRICKS_INSTANCE_PROFILE>"
}

resource "databricks_pipeline" "this" {
  name    = var.pipeline_name 
  catalog = var.catalog       
  target  = var.target_schema
  photon  = false
  edition = "ADVANCED" 
  channel = "PREVIEW" # UNITY CATALOG IS STILL IN PREVIEW FOR DELTA PIPELINES
  continuous = false
  development = var.pipeline_mode
  cluster {
    label        = "default"
    node_type_id = var.node_type_id
    autoscale {
      min_workers = var.default_cluster_min_workers
      max_workers = var.default_cluster_max_workers
    }
    custom_tags = {
      cluster_type = "default"
      processor    = var.client_processor
    }
    aws_attributes {
      instance_profile_arn = local.instance_profile_arn
    }
  }

  cluster {
    label        = "maintenance"
    node_type_id = var.node_type_id
    autoscale {
      min_workers = var.maintenance_cluster_min_workers
      max_workers = var.maintenance_clusters_max_workers
    }
    custom_tags = {
      cluster_type = "maintenance"
      processor    = var.client_processor
    }
    aws_attributes {
      instance_profile_arn = local.instance_profile_arn
    }
  }

  # CAN BE A PYTHON OR NOTEBOOK PATH
  library {
    file {
      path = var.python_file_path
    }
  }
}