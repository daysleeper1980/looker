view: usage {
  sql_table_name: `pacific-arcadia-310908.1.usage`
    ;;

  dimension: asset {
    type: string
    sql: ${TABLE}.Asset ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.Time ;;
  }

  dimension: use {
    type: number
    sql: ${TABLE}.Use ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
