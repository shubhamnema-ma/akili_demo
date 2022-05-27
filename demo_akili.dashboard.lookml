- dashboard: akili_demo
  title: Akili demo
  layout: newspaper
  preferred_viewer: dashboards
  crossfilter_enabled: true
  description: ''
  preferred_slug: AHFlaer3tIOv0TTwdeShvg
  elements:
  - title: Total Profit
    name: Total Profit
    model: akili_looker_demo
    explore: orders
    type: looker_pie
    fields: [orders.category, orders.total_profit]
    sorts: [orders.total_profit desc]
    limit: 500
    query_timezone: UTC
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_types: {}
    defaults_version: 1
    listen:
      State: orders.state
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Avg Profit
    name: Avg Profit
    model: akili_looker_demo
    explore: orders
    type: looker_area
    fields: [orders.order_year, orders.average_profit]
    fill_fields: [orders.order_year]
    sorts: [orders.order_year desc]
    limit: 500
    query_timezone: UTC
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: 80d0e28a-6146-432d-a064-7bfb639e22f0
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    defaults_version: 1
    listen:
      State: orders.state
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Order Count
    name: Order Count
    model: akili_looker_demo
    explore: orders
    type: looker_bar
    fields: [orders.region, orders.count]
    sorts: [orders.count desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      State: orders.state
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Customer Details
    name: Customer Details
    model: akili_looker_demo
    explore: orders
    type: looker_grid
    fields: [orders.customer_name, orders.city, orders.product_name]
    sorts: [orders.customer_name]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    header_font_color: "#ffffff"
    header_background_color: "#000"
    series_types: {}
    defaults_version: 1
    listen:
      State: orders.state
    row: 6
    col: 0
    width: 16
    height: 6
  filters:
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: akili_looker_demo
    explore: orders
    listens_to_filters: []
    field: orders.state
