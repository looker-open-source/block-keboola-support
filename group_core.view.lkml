include: "//@{CONFIG_PROJECT_NAME}/group.view"

view: group {
  extends: [group_config]
}

view: group_core {
  sql_table_name: @{SCHEMA_NAME}."GROUP" ;;
  drill_fields: [group_id]

  dimension: group_id {
    label: "Group ID"
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