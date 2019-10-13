connection: "@{connection}"

# include all the views
include: "/views/**/*.view"

datagroup: zendesk_block_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: zendesk_block_default_datagroup

explore: company {}

explore: customer {
  join: company {
    type: left_outer
    sql_on: ${customer.company_id} = ${company.company_id} ;;
    relationship: many_to_one
  }
}

explore: employee {}

explore: employee_group {
  join: employee {
    type: left_outer
    sql_on: ${employee_group.employee_id} = ${employee.employee_id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${employee_group.group_id} = ${group.group_id} ;;
    relationship: many_to_one
  }
}

explore: ticket {
  join: employee {
    type: left_outer
    sql_on: ${ticket.employee_id} = ${employee.employee_id} ;;
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
