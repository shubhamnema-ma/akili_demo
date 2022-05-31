view: derived_demo {
  derived_table: {
    sql: select customername,(SUM(profit)/SUM(sales)) profit_per
      from `mlconsole-poc.looker_Demo.orders`
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: customername {
    type: string
    sql: ${TABLE}.customername ;;
  }

  dimension: profit_per {
    type: number
    sql: ${TABLE}.profit_per ;;
  }
  measure: per_profit {
    type: sum
    sql: ${profit_per} ;;
    value_format_name: percent_2
  }

  set: detail {
    fields: [customername, profit_per]
  }
}
