view: weather_forecast {
  sql_table_name: `mlconsole-poc.tellusdemo.weather_forecast`
    ;;

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: cloud_cover {
    type: number
    sql: ${TABLE}.cloud_cover ;;
  }

  measure: total_cloud_cover {
    type: sum
    sql: ${cloud_cover} ;;
  }

  measure: average_cloud_cover {
    type: average
    sql: ${cloud_cover} ;;
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
    sql: ${TABLE}.date_time ;;
  }

  dimension: humidity {
    type: number
    sql: ${TABLE}.humidity ;;
  }

  dimension: precipitation {
    type: number
    sql: ${TABLE}.precipitation ;;
  }

  dimension: pressure {
    type: number
    sql: ${TABLE}.pressure ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension_group: sunrise {
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
    sql: ${TABLE}.sunrise_time ;;
  }

  dimension_group: sunset {
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
    sql: ${TABLE}.sunset_time ;;
  }

  dimension: temperature {
    type: number
    sql: ${TABLE}.temperature ;;
  }

  dimension: uv_index {
    type: number
    sql: ${TABLE}.uv_index ;;
  }

  dimension: wind_direction {
    type: string
    sql: ${TABLE}.wind_direction ;;
  }

  dimension: wind_speed {
    type: number
    sql: ${TABLE}.wind_speed ;;
  }

  dimension: tower_id {
    type: string
    sql: ${TABLE}.tower_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


  measure: wind_speed_sum {
    label: "Wind Speed"
    type: max
    value_format_name: decimal_2
    sql: ${wind_speed};;
  }

  measure: temperature_max {
    type: max
    label: "Temperature"
    value_format_name: decimal_2
    sql: ${temperature} ;;
  }

  measure: precipitation_max {
    type: max
    label: "Precipitation"
    value_format_name: decimal_2
    sql: ${precipitation} ;;
  }

  measure: pressure_max {
    type: max
    label: "Pressure"
    value_format_name: decimal_2
    sql: ${pressure} ;;
  }

  measure: humidity_max {
    type: max
    label: "Humidity"
    value_format_name: decimal_2
    sql: ${humidity} ;;
  }

  measure: cloud_cover_max {
    type: max
    label: "Cloud Cover"
    value_format_name: decimal_2
    sql: ${cloud_cover} ;;
  }

  measure: uv_index_max {
    type: max
    label: "UV Index"
    value_format_name: decimal_2
    sql: ${uv_index} ;;
  }




  parameter: weather_condition {
    label: "Weather Condition"
    type: string

    allowed_value: {
      label: "Wind Speed"
      value: "wind_speed_sum"
    }
    allowed_value: {
      label: "Temperature"
      value: "temperature_max"
    }
    allowed_value: {
      label: "Precipitation"
      value: "precipitation_max"
    }
    allowed_value: {
      label: "Pressure"
      value: "pressure_max"
    }
    allowed_value: {
      label: "Humidity"
      value: "humidity_max"
    }
    allowed_value: {
      label: "Cloud Cover"
      value: "cloud_cover_max"
    }
    allowed_value: {
      label: "UV Index"
      value: "uv_index_max"
    }

    }

    measure: weather {
      type: number
      hidden: no
      sql: case
            when {% parameter weather_condition %} = "wind_speed_sum" then ${wind_speed_sum}
            when {% parameter weather_condition %} = 'temperature_max' then ${temperature_max}
            when {% parameter weather_condition %} = 'precipitation_max' then ${precipitation_max}
            when {% parameter weather_condition %} = 'pressure_max' then ${pressure_max}
            when {% parameter weather_condition %} = 'humidity_max' then ${humidity_max}
            when {% parameter weather_condition %} = 'cloud_cover_max' then ${cloud_cover_max}
            when {% parameter weather_condition %} = 'uv_index_max' then ${uv_index_max}
            end ;;
    }


  dimension: html_power{
    hidden: no
    view_label: "HTML"
    type: string
    sql: 1 ;;
    html:

    <div style = "width: 100% ;
    display:block
    color: #ffffff;
    font-size:13pt;
    font-family:arial;
    padding: 5px 25px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #D3D3D3;">Tellus Real Time Monitoring Dashboard
    </div>

    <div>
    <a style="color: #ffffff;
    font-size:13pt;
    font-family:arial;
    width:33.33%;
    padding: 5px 30px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #E8710A;" href="#home">Power Consumption</a>

    <a style="color: #000000;
    font-size:13pt;
    font-family:arial;
    width: 33.33%;
    padding: 5px 30px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #ffffff;"href="https://mediaagility.looker.com/dashboards/718?Weather+Condition=wind%5E_speed%5E_sum">Weather Report</a>

    <a style="color: #000000;
    font-size:13pt;
    font-family:arial;
    width:33.33%;
    padding: 5px 30px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #ffffff;" href="https://mediaagility.looker.com/dashboards/719?Tower+=&Technician=&Mobile+Generator+ID=">Technician/Generator</a>
      </div>
    </div>
      ;;

}

    dimension: html_weather{
      hidden: no
      view_label: "HTML"
      type: string
      sql: 1 ;;
      html:

      <div style = "width: 100% ;
      display:block
      color: #ffffff;

      font-size:13pt;
      font-family:arial;
      padding: 5px 25px;
      border-top: solid 1px #000000;
      border-left: solid 1px #000000;
      border-right: solid 1px #000000;
      border-bottom: solid 1px #000000;
      border-radius: 5px 5px 0 0;
      float: left;
      line-height: 20px;
      background-color: #D3D3D3;">Tellus Real Time Monitoring Dashboard
      </div>

      <a style="color: #000000;
      font-size:13pt;
      font-family:arial;
      width:33.33%;
      padding: 5px 30px;
      border-top: solid 1px #000000;
      border-left: solid 1px #000000;
      border-right: solid 1px #000000;
      border-bottom: solid 1px #000000;
      border-radius: 5px 5px 0 0;
      float: left;
      line-height: 20px;
      background-color: #ffffff;" href="https://mediaagility.looker.com/dashboards/717?Tower+ID=">Power Consumption</a>

      <a style="color: #ffffff;
      font-size:13pt;
      font-family:arial;
      width:33.33%;
      padding: 5px 30px;
      border-top: solid 1px #000000;
      border-left: solid 1px #000000;
      border-right: solid 1px #000000;
      border-bottom: solid 1px #000000;
      border-radius: 5px 5px 0 0;
      float: left;
      line-height: 20px;
      background-color: #E8710A;"href="#home">Weather Report</a>

          <a style="color: #000000;
    font-size:13pt;
    font-family:arial;
    width:33.33%;
    padding: 5px 30px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #ffffff;" href="https://mediaagility.looker.com/dashboards/719?Tower+=&Technician=&Mobile+Generator+ID=">Technician/Generator</a>
      </div>
      ;;
}


  dimension: html_technician{
    type: string
    sql: 1 ;;
    hidden: no
    view_label: "HTML"
    html:
    <div style = "width: 100% ;
    display:block
    color: #ffffff;
    font-size:13pt;
    font-family:arial;
    padding: 5px 25px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #D3D3D3;">Tellus Real Time Monitoring Dashboard
    </div>
    <a style="color: #000000;
    font-size:13pt;
    font-family:arial;
    width:33.33%;
    padding: 5px 30px;
    border-top: solid 1px #000000;
    border-left: solid 1px #000000;
    border-right: solid 1px #000000;
    border-bottom: solid 1px #000000;
    border-radius: 5px 5px 0 0;
    float: left;
    line-height: 20px;
    background-color: #ffffff;" href="https://mediaagility.looker.com/dashboards/717?Tower%20ID=">Power Consumption</a>

      <a style="color: #000000;
      font-size:13pt;
      font-family:arial;
      width:33.33%;
      padding: 5px 30px;
      border-top: solid 1px #000000;
      border-left: solid 1px #000000;
      border-right: solid 1px #000000;
      border-bottom: solid 1px #000000;
      border-radius: 5px 5px 0 0;
      float: left;
      line-height: 20px;
      background-color: #ffffff;"href="https://mediaagility.looker.com/dashboards/718?Weather+Condition=wind%5E_speed%5E_sum">Weather Report</a>

      <a style="color: #ffffff;
      font-size:13pt;
      font-family:arial;
      width:33.33%;
      padding: 5px 25px;
      border-top: solid 1px #000000;
      border-left: solid 1px #000000;
      border-right: solid 1px #000000;
      border-bottom: solid 1px #000000;
      border-radius: 5px 5px 0 0;
      float: left;
      line-height: 20px;
      background-color: #E8710A;"href="#home">Technician/Generator</a>
      </div>;;
  }

}
