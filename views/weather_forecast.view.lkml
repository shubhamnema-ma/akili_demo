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
    }

    measure: weather {
      type: number
      sql: case
            when {% parameter weather_condition %} = "wind_speed_sum" then ${wind_speed_sum}
            when {% parameter weather_condition %} = 'temperature_max' then ${temperature_max}
            when {% parameter weather_condition %} = 'precipitation_max' then ${precipitation_max}
            when {% parameter weather_condition %} = 'pressure_max' then ${pressure_max}
            end ;;
    }





}
