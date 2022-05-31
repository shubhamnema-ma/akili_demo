project_name: "akili_looker_demo"

#constant: VIS_LABEL {
#  value: "Liquid Fill Gauge Akili"
#  export: override_optional
#}
#
#constant: VIS_ID {
#  value: "liquid_fill_gauge-marketplace-Akili"
#  export:  override_optional
#}
#
#visualization: {
#  id: "@{VIS_ID}"
#  url: "https://marketplace-api.looker.com/viz-dist/liquid_fill_gauge.js"
#  label: "@{VIS_LABEL}"
#}



constant: VIS_LABEL {
  value: "Gauge Akili"
  export: override_optional
}

constant: VIS_ID {
  value: "gauge-marketplace akili"
  export:  override_optional
}

visualization: {
  id: "@{VIS_ID}"
  url: "https://marketplace-api.looker.com/viz-dist/gauge_chart.js"
  label: "@{VIS_LABEL}"
}
