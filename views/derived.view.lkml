view: derived {
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

  set: detail {
    fields: [customername, profit_per]
  }
}
