view: employee_group {
  sql_table_name: "EMPLOYEE_GROUP" ;;

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
