variable "client_processor" {
  description = "The client name"
  type        = string
}

variable "pipeline_name" {
  description = "The name of the pipeline"
  type        = string
}

variable "catalog" {
  description = "target catalog name"
  type        = string
}

variable "target_schema" {
  description = "target schema name"
  type        = string
}

variable "pipeline_mode" {
  description = "Whether the pipeline is in development mode or production mode."
  type        = bool
}

variable "node_type_id" {
  description = "The node type id"
  type        = string
}

variable "python_file_path" {
  description = "databricks workspace repo path to python file"
  type        = string
}

variable "default_cluster_min_workers" {
  description = "The default cluster min workers"
  type        = number
}

variable "default_cluster_max_workers" {
  description = "The default cluster max workers"
  type        = number
}

variable "maintenance_cluster_min_workers" {
  description = "The maintenance cluster min workers"
  type        = number
}

variable "maintenance_clusters_max_workers" {
  description = "The maintenance cluster max workers"
  type        = number
}

variable "quartz_cron_expression" {
  description = "quartz cron expression"
  type        = string
}

