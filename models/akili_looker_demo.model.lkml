connection: "dv-looker-poc"

include: "/views/**/*.view"

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
