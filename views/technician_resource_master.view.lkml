view: technician_resource_master {
  sql_table_name: `mlconsole-poc.tellusdemo.technician_resource_master`
    ;;

  dimension: billing {
    type: number
    sql: ${TABLE}.Billing ;;
  }

  measure: total_billing {
    type: sum
    sql: ${billing} ;;
  }

  measure: average_billing {
    type: average
    sql: ${billing} ;;
  }

  dimension: equipment {
    type: string
    sql: ${TABLE}.Equipment ;;
  }

  # dimension: location {
  #   type: string
  #   sql: ${TABLE}.location ;;
  # }

  dimension: location {
    type: location
    sql_latitude: Replace(substring(${TABLE}.location, 2 ,8),'(',"") ;;
    sql_longitude: REPLACE(substring(${TABLE}.location, 12 ,21),')',"") ;;
  }


  dimension: parts_inventory {
    type: string
    sql: ${TABLE}.Parts_Inventory ;;
  }

  dimension: phone_no {
    type: string
    sql: ${TABLE}.Phone_No ;;
  }

  dimension: technician {
    type: string
    sql: ${TABLE}.Technician ;;
  }

  dimension: technician_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.technician_id ;;
  }

  dimension: time_tracking {
    type: string
    sql: ${TABLE}.Time_Tracking ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
