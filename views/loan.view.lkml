# The name of this view in Looker is "Loan"
view: loan {
  sql_table_name: `mlconsole-poc.looker_db.loan`
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

  dimension: borrower_name {
    type: string
    sql: ${TABLE}.Borrower_Name ;;
  }

  dimension_group: disbursal {
    type: time
    description: "%m/%d/%E4Y"
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

  dimension: liability {
    type: string
    sql: ${TABLE}.Liability ;;
  }

  dimension: loan_default {
    type: yesno
    sql: ${TABLE}.LOAN_DEFAULT ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.REGION ;;
  }

  dimension: type_of_loan {
    type: string
    sql: ${TABLE}.TYPE_OF_LOAN ;;
  }

  dimension: unique_id {
    type: number
    sql: ${TABLE}.Unique_Id ;;
  }

  measure: count {
    type: count
    drill_fields: [borrower_name]
  }

  measure: count_of_bad_loan {
    type: count_distinct
    sql: ${unique_id};;
    filters: [loan_default: "Yes"]
  }



}
