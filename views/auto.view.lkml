
view: auto {
  sql_table_name: `mlconsole-poc.looker_db.auto`
    ;;

  dimension: asset_cost {
    type: number
    sql: ${TABLE}.ASSET_COST ;;
  }


  measure: total_asset_cost {
    type: sum
    sql: ${asset_cost} ;;
  }

  measure: average_asset_cost {
    type: average
    sql: ${asset_cost} ;;
  }

  dimension: branch_id {
    type: number
    sql: ${TABLE}.BRANCH_ID ;;
  }


  dimension_group: disbursal {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DISBURSAL_DATE ;;
  }

  dimension: disbursed_amount {
    type: number
    sql: ${TABLE}.DISBURSED_AMOUNT ;;
  }

  dimension: employment_type {
    type: string
    sql: ${TABLE}.EMPLOYMENT_TYPE ;;
  }

  dimension: loan_default {
    type: yesno
    sql: ${TABLE}.LOAN_DEFAULT ;;
  }

  dimension: ltv {
    type: number
    sql: ${TABLE}.LTV ;;
  }

  dimension: manufacturer_id {
    type: number
    sql: ${TABLE}.MANUFACTURER_ID ;;
  }

  dimension: maturities {
    type: string
    sql: ${TABLE}.MATURITIES ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.REGION ;;
  }

  dimension: supplier_id {
    type: number
    sql: ${TABLE}.SUPPLIER_ID ;;
  }

  dimension: type_of_loan {
    type: string
    sql: ${TABLE}.TYPE_OF_LOAN ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.UNIQUE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_loans_2019 {
    type: count_distinct
    sql: ${unique_id};;
    filters: [disbursal_year: "2019"]
  }

  measure: total_loans_2020 {
    type: count_distinct
    sql: ${unique_id};;
    filters: [disbursal_year: "2020"]
  }

  measure: total_loans{
    type: count_distinct
    sql: ${unique_id};;

  }

  measure: total_disburse_amount {
    type: sum
    sql: ${disbursed_amount} ;;
  }

  measure: total_asset_amount {
    type: sum
    sql: ${asset_cost} ;;
  }

  measure: count_of_bad_loan {
    type: count_distinct
    sql: ${unique_id};;
    filters: [loan_default: "Yes"]

  }



}
