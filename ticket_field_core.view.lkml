include: "//@{CONFIG_PROJECT_NAME}/ticket_field.view"

view: ticket_field {
  extends: [ticket_field_config]
}

view: ticket_field_core {
  sql_table_name: @{SCHEMA_NAME}."TICKET_FIELD" ;;
  drill_fields: [ticket_field_id]

  dimension: ticket_field_id {
    label: "Ticket Field ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."TICKET_FIELD_ID" ;;
  }

  dimension: field_type {
    type: string
    sql: ${TABLE}."FIELD_TYPE" ;;
  }

  dimension: ticket_field {
    type: string
    sql: ${TABLE}."TICKET_FIELD" ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket_field_id]
  }
}