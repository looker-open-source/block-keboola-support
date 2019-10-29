include: "//@{CONFIG_PROJECT_NAME}/views/employee_group.view"

view: employee_group {
  extends: [employee_group_config]
}

view: employee_group_core {
  sql_table_name: @{SCHEMA_NAME}."EMPLOYEE_GROUP" ;;

  dimension: employee_group_id {
    type: string
    label: "Employee Group ID"
    primary_key: yes
    sql: ${employee_id}||'_'||${group_id} ;;
  }

  dimension: employee_id {
    type: string
    hidden: yes
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: group_id {
    type: string
    hidden: yes
    sql: ${TABLE}."GROUP_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [employee.employee_id, group.group_id]
  }
}
