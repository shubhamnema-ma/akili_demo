view: current_power_usage {
  sql_table_name: `mlconsole-poc.tellusdemo.current_power_usage`
    ;;

  dimension: p_key {
    type: string
    primary_key: yes
    sql: concat(${date_raw},"|",${tower_id},"|",${power_type}) ;;
  }

  dimension: date_range {
    type: string
    sql: concat("Date & Time"," - ",${date_time}) ;;
    hidden: no
  }


  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    datatype: datetime
    sql: ${TABLE}.date_time ;;
  }

  dimension: power_consumption {
    type: number
    sql: ${TABLE}.power_consumption ;;
  }

  measure: total_power_consumption {
    type: sum
    sql: ${power_consumption} ;;
  }

  measure: average_power_consumption_30 {
    type: number
    value_format_name: decimal_0
    sql:
        avg(${average_power_consumption}) OVER(ORDER BY MAX(${date_time})
        ROWS BETWEEN 20 PRECEDING AND CURRENT ROW )
        ;;
  }


measure: power_consumption_max {
  type: max
  sql: ${power_consumption} ;;
}

 measure: average_power_consumption {
    type: average
    sql: ${power_consumption} ;;
    value_format_name: decimal_0
  }

  dimension: power_type {
    type: string
    sql: ${TABLE}.power_type ;;
  }

  dimension: tower_id {
    type: string
    sql: ${TABLE}.tower_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
