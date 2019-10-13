view: ticket_field {
  sql_table_name: "TICKET_FIELD" ;;
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
