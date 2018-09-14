view: datapipeline_log_pdt_test {
  derived_table: {
    sql: SELECT 'test custom sql to populate a pdt' as test_note,* FROM DBO.DATAPIPELINE_LOG;;
    persist_for: "24 hours"
#km 9/13 - snowflake doesn't support indices, though this discourse notes that sorting the pdt will function like a primary index, apparently
  }

  dimension: test_note {}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: run_status {
    type: string
    sql: ${TABLE}."RUN_STATUS" ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}."PROJECT_NAME" ;;
  }

  dimension_group: end_time {
    type: time
    sql: ${TABLE}."END_TIME" ;;
  }

  set: detail {
    fields: [run_status, project_name, end_time_time]
  }
}
