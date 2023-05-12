view: site_technician_mapping {
  sql_table_name: `mlconsole-poc.tellusdemo.site_technician_mapping`
    ;;
  dimension: approx_time {
    type: string
    sql: ${TABLE}.approx_time ;;
  }

  dimension: site_distance {
    type: string
    sql: ${TABLE}.site_distance ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.site_id ;;
  }

  dimension: technician_id {
    type: number
    sql: ${TABLE}.technician_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: number_of_technician {
    type: count_distinct
    sql: ${technician_id} ;;

  }
}
