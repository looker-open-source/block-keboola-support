view: group {
  sql_table_name: "GROUP" ;;
  drill_fields: [group_id]

  dimension: group_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."GROUP_ID" ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}."GROUP" ;;
  }

  measure: count {
    type: count
    drill_fields: [group_id, employee_group.count]
  }
}
