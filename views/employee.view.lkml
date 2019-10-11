view: employee {
  sql_table_name: "EMPLOYEE" ;;
  drill_fields: [employee_id]

  dimension: employee_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: employee {
    type: string
    sql: ${TABLE}."EMPLOYEE" ;;
  }

  measure: count {
    type: count
    drill_fields: [employee_id, employee_group.count, ticket.count]
  }
}
