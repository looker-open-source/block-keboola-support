include: "//@{CONFIG_PROJECT_NAME}/company.view"

view: company {
  extends: [company_config]
}

view: company_core {
  sql_table_name: @{SCHEMA_NAME}."COMPANY" ;;
  drill_fields: [company]

  dimension: company_id {
    label: "Company ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."COMPANY_ID" ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}."COMPANY" ;;
  }

  dimension_group: date_created {
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
    sql: ${TABLE}."DATE_CREATED" ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}."WEBSITE" ;;
  }

  measure: count {
    type: count
    drill_fields: [company_id, customer.count]
  }
}