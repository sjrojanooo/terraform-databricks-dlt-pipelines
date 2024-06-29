output "pipeline_name" {
  description = "The name of the databricks pipeline"
  value       = databricks_pipeline.this.name
}

output "pipeline_id" {
  description = "The ID of the databricks pipeline that is created"
  value       = databricks_pipeline.this.id
}