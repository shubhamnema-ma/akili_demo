view: site_mobile_generator_mapping {
  sql_table_name: `mlconsole-poc.tellusdemo.site_mobile_generator_mapping`
    ;;

  dimension: approx_time {
    type: string
    sql: ${TABLE}.approx_time ;;
  }

  dimension: mobile_generator_id {
    type: string
    sql: ${TABLE}.mobile_generator_id ;;
  }

  dimension: site_distance {
    type: string
    sql: ${TABLE}.site_distance ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.site_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: number_of_generator {
    type: count_distinct
    sql: ${mobile_generator_id} ;;

  }



}
