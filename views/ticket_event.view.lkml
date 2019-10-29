view: ticket_event {
  sql_table_name: "TICKET_EVENT" ;;

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
