include: "//@{CONFIG_PROJECT_NAME}/ticket_field_value.view"

view: ticket_field_value {
  extends: [ticket_field_value_config]
}

view: ticket_field_value_core {
  sql_table_name: @{SCHEMA_NAME}."TICKET_FIELD_VALUE" ;;

  dimension: pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: CONCAT(${ticket_id}, '_', ${ticket_field_id}) ;;
  }

  dimension: ticket_field {
    type: string
    sql: ${TABLE}."TICKET_FIELD" ;;
  }

  dimension: ticket_field_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TICKET_FIELD_ID" ;;
  }

  dimension: ticket_field_type {
    type: string
    sql: ${TABLE}."TICKET_FIELD_TYPE" ;;
  }

  dimension: ticket_field_value {
    type: string
    sql: ${TABLE}."TICKET_FIELD_VALUE" ;;
  }

  dimension: ticket_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TICKET_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
