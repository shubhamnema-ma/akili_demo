view: site_master {
  sql_table_name: `mlconsole-poc.tellusdemo.site_master`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ID ;;
  }


  dimension: zipcode {
    type: string
    sql: ${TABLE}.zipcode ;;
  }

  dimension: ac_service_provider {
    type: string
    sql: ${TABLE}.AC_Service_Provider ;;
  }

  dimension: block {
    type: string
    sql: ${TABLE}.Block ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.Carrier ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.Comments ;;
  }

  dimension: height_to_top_of_antenna {
    type: number
    sql: ${TABLE}.Height_to_Top_of_Antenna ;;
  }

  dimension: hight_and_bulk_district {
    type: string
    sql: ${TABLE}.Hight_and_Bulk_District ;;
  }

  dimension: location_1 {
    type: location
    sql_latitude: Replace(substring(${TABLE}.Location_1, 2 ,8),'(',"") ;;
    sql_longitude: REPLACE(substring(${TABLE}.Location_1, 12 ,21),')',"") ;;
  }

  dimension: location_of_bts {
    type: string
    sql: ${TABLE}.Location_of_BTS ;;
  }

  dimension: lot {
    type: string
    sql: ${TABLE}.Lot ;;
  }

  dimension: number_of_antennas {
    type: number
    sql: ${TABLE}.Number_of_Antennas ;;
  }

  measure: total_number_of_antennas {
    type: sum
    sql: ${number_of_antennas} ;;
  }

  measure: average_number_of_antennas {
    type: average
    sql: ${number_of_antennas} ;;
  }

  dimension: owner_operator {
    type: string
    sql: ${TABLE}.Owner_Operator ;;
  }

  dimension: power_output_of_equipment__watts_ {
    type: number
    sql: ${TABLE}.Power_Output_of_Equipment__Watts_ ;;
  }

  measure: static_power {
    type: sum
    sql: ${power_output_of_equipment__watts_} ;;

  }

  dimension: preference__1_7_ {
    type: string
    sql: ${TABLE}.Preference__1_7_ ;;
  }

  dimension: radio_frequency_range__megahertz_ {
    type: string
    sql: ${TABLE}.Radio_Frequency_Range__Megahertz_ ;;
  }

  dimension: search_ring_name_id {
    type: string
    sql: ${TABLE}.Search_Ring_Name_ID ;;
  }

  dimension: to_phone_number {
    type: string
    sql: ${TABLE}.TO_Phone_Number ;;
  }

  dimension: type_of_building {
    type: string
    sql: ${TABLE}.Type_of_Building ;;
  }

  dimension: type_of_consumer_products {
    type: string
    sql: ${TABLE}.Type_of_Consumer_Products ;;
  }

  dimension: type_of_consumer_services {
    type: string
    sql: ${TABLE}.Type_of_Consumer_Services ;;
  }

  dimension: type_of_technology {
    type: string
    sql: ${TABLE}.Type_of_Technology ;;
  }

  dimension: zoning_district {
    type: string
    sql: ${TABLE}.Zoning_District ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
