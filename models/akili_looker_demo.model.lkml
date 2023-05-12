connection: "dv-looker-poc"

include: "/views/**/*.view"

explore: site_master {
  join: current_power_usage {
    sql_on: ${site_master.id} = ${current_power_usage.tower_id} ;;
    type: left_outer
    relationship: one_to_many
  }

  join: weather_forecast {
    sql_on: ${site_master.id} = ${weather_forecast.tower_id} ;;
    type: inner
    relationship: one_to_one
  }

  join: site_technician_mapping {
    sql_on: ${site_master.id} = ${site_technician_mapping.site_id}  ;;
    relationship: one_to_one
    type: left_outer
  }

  join: technician_resource_master {
    sql_on: ${site_technician_mapping.technician_id} = ${technician_resource_master.technician_id} ;;
    type: inner
    relationship: one_to_one
  }

  join: site_mobile_generator_mapping {
    sql_on: ${site_master.id} =  ${site_mobile_generator_mapping.site_id} ;;
    relationship: one_to_one
    type: left_outer
  }

  join: mobile_generator_master {
    sql_on: ${mobile_generator_master.generator_id} = ${site_mobile_generator_mapping.mobile_generator_id} ;;
    type: inner
    relationship: one_to_one
  }


}


explore: auto {}
explore: loan {}

explore: orders {
#  access_filter: {
#    field: city
#    user_attribute: city
#  }

  join: returns {
    type: left_outer
    sql_on: ${orders.order_id} = ${returns.order_id} ;;
    relationship: many_to_one
  }
}

explore: people {
  persist_with: akili_looker_demo_default_datagroup
}

explore: derived_demo {}
explore: derived {}


datagroup: akili_looker_demo_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 minute"
}

persist_with: akili_looker_demo_default_datagroup

access_grant: can_view {
  user_attribute: city
  allowed_values: ["All"]
}
