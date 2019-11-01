include: "//@{CONFIG_PROJECT_NAME}/ticket_event.view"

view: ticket_event {
  extends: [ticket_event_config]
}

view: ticket_event_core {
  sql_table_name: @{SCHEMA_NAME}."TICKET_EVENT" ;;

  dimension: event {
    type: string
    sql: ${TABLE}."EVENT" ;;
  }

  dimension_group: event {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."EVENT_DATE" ;;
  }

  dimension: ticket_id {
    type: string
    hidden: yes
    sql: ${TABLE}."TICKET_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [ticket.ticket_id]
  }
}