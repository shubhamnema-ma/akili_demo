view: current_power_usage {
  sql_table_name: `mlconsole-poc.tellusdemo.current_power_usage`
    ;;

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

  measure: delta {
    sql: ${site_master.static_power} - ${average_power_consumption_30};;
    type: number
    value_format_name: decimal_0
  }

  measure: delta_per {
    sql: ${delta} / nullif(${site_master.static_power},0 );;
    type: number
    value_format_name: percent_2
  }

  measure: delta_percentage_color {
    hidden: yes
    type: string
    value_format_name: percent_2
    sql:case
      when ${delta_per} < .05 then "red" else "green" end;;
  }

  measure: html {
    hidden: no
    type: string
    view_label: "HTML"
    sql: 1 ;;
    html:
      <table style="width:100%">
              <tr style="height:25pt">
                <td style="width:33%; text-align:right; font-family:arial ;font-size: 13pt ">Tower: {{tower_id._rendered_value}}</td>
                <td style="width:34%; text-align:right"></td>
              </tr>
              <tr style="height:25pt">
                <td style="width:33%; text-align:left;font-family:arial ;font-size: 13pt">Current Power Usage</td>
                <td style="width:33%; text-align:right; font-family:arial ;font-size: 13pt; color: {{delta_percentage_color._rendered_value}}">{{average_power_consumption_30._rendered_value}}</td>
               </tr>
              <tr style="height:25pt">
                <td style="width:33%; text-align:left;font-family:arial ;font-size: 13pt ">Watt Capacity</td>
                <td style="width:33%; text-align:right;font-family:arial ;font-size: 13pt">{{site_master.static_power._rendered_value}}</td>
                </tr>
          </table>;;
  }



 measure: average_power_consumption {
    type: average
    sql: ${power_consumption} ;;
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
