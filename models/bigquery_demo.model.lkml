connection: "new_connection"
include: "usage.view"

datagroup: bigquery_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bigquery_demo_default_datagroup

explore: usage {}
