resource "databricks_job" "this" {
  name = "${var.pipeline_name}_schedule"
  task {
    task_key = "<SOME_TASK_KEY>"
    pipeline_task {
      pipeline_id = databricks_pipeline.this.id
    }
  }
  schedule {
    quartz_cron_expression = var.quartz_cron_expression
    timezone_id            = "<YOUR_TIMEZONE>"
  }
  depends_on = [
    databricks_pipeline.this
  ]
}