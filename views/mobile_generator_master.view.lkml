view: mobile_generator_master {
  sql_table_name: `mlconsole-poc.tellusdemo.mobile_generator_master`
    ;;

  dimension: approved_by {
    type: string
    sql: ${TABLE}.Approved_By ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.Comments ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.Created_By ;;
  }

  dimension: fuel_delivery {
    type: yesno
    sql: ${TABLE}.Fuel_Delivery ;;
  }

  dimension: fuel_level {
    type: number
    sql: ${TABLE}.Fuel_Level ;;
  }

  measure: total_fuel_level {
    type: sum
    sql: ${fuel_level} ;;
  }

  measure: average_fuel_level {
    type: average
    sql: ${fuel_level} ;;
  }

  dimension: fuel_type {
    type: string
    sql: ${TABLE}.Fuel_Type ;;
  }

  dimension: generator_id {
    type: string
    sql: ${TABLE}.Generator_ID ;;
  }

  dimension: generator_status {
    type: string
    sql: ${TABLE}.Generator_Status ;;
  }

  dimension: location {
    type: location
    sql_latitude: Replace(substring(${TABLE}.Location, 2 ,8),'(',"") ;;
    sql_longitude: REPLACE(substring(${TABLE}.Location, 14 ,21),')',"") ;;
  }

  dimension: operator_phone {
    type: string
    sql: ${TABLE}.Operator_Phone ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
