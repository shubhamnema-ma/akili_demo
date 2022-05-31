# Define the database connection to be used for this model.
connection: "dv-looker-poc"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.




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



datagroup: akili_looker_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 minuter"
}

persist_with: akili_looker_demo_default_datagroup

access_grant: can_view {
  user_attribute: city
  allowed_values: ["All"]
}
