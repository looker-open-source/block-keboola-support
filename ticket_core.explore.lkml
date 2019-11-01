explore: ticket_core {
  hidden: yes
  extension: required

  join: employee {
    type: left_outer
    sql_on: ${ticket.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: employee_group {
    type: left_outer
    sql_on: ${employee.employee_id} = ${employee_group.employee_id} ;;
    relationship: one_to_many
  }

  join: group {
    type: left_outer
    sql_on: ${employee_group.group_id} = ${group.group_id} ;;
    relationship: many_to_one
  }

  join: ticket_field_value {
    type: left_outer
    sql_on: ${ticket_field_value.ticket_id} = ${ticket.ticket_id} ;;
    relationship: one_to_many
  }

  join: ticket_event {
    type: left_outer
    sql_on: ${ticket_event.ticket_id} = ${ticket.ticket_id} ;;
    relationship: one_to_many
  }

  join: customer {
    type: left_outer
    sql_on: ${ticket.customer_id} = ${customer.customer_id} ;;
    relationship: many_to_one
  }

  join: company {
    type: left_outer
    sql_on: ${customer.company_id} = ${company.company_id} ;;
    relationship: many_to_one
  }
}
