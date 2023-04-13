# If necessary, uncomment the line below to include explore_source.

# include: "akili_looker_demo.model.lkml"

view: add_a_unique_name_1654015363 {
  derived_table: {
    explore_source: orders {
      column: customer_name {}
      column: average_profit {}
    }
  }
  dimension: customer_name {
    description: ""
  }
  dimension: average_profit {
    description: ""
    type: number
  }
}
