include: "//@{CONFIG_PROJECT_NAME}/ticket.view"

view: ticket {
  extends: [ticket_config]
}

view: ticket_core {
  sql_table_name: @{SCHEMA_NAME}."TICKET" ;;
  drill_fields: [ticket_list*]

  dimension: ticket_id {
    label: "Ticket ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."TICKET_ID" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL" ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}."PRIORITY" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension_group: since_open {
    type: duration
    intervals: [day, hour, minute]
    sql_start: ${TABLE}."CREATED_DATE" ;;
    sql_end: current_date ;;
  }

  dimension_group: since_update {
    type: duration
    intervals: [day, hour, minute]
    sql_start: ${TABLE}."LAST_UPDATE" ;;
    sql_end: current_date ;;
  }

  dimension: tickets_aging {
    case: {
      when: {
        label: "30 or more"
        sql: ${days_since_open}>30 ;;
      }
      when: {
        label: "15 - 30"
        sql: ${days_since_open}<=30 AND ${days_since_open} > 14 ;;
      }
      when: {
        label: "8 - 14"
        sql: ${days_since_open}<=14 AND ${days_since_open} > 7 ;;
      }
      when: {
        label: "2 - 7"
        sql: ${days_since_open}<=7 AND ${days_since_open} > 1 ;;
      }
      else: "1 or less"
    }
  }

  dimension: customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: employee_id {
    type: string
    hidden: yes
    sql: ${TABLE}."EMPLOYEE_ID" ;;
  }

  dimension: first_reply_time_business_m_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."FIRST_REPLY_TIME_BUSINESS_M" ;;
  }

  dimension: first_reply_time_total_m_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."FIRST_REPLY_TIME_TOTAL_M" ;;
  }

  measure: first_reply_time_average {
    type: average
    sql: ${first_reply_time_total_m_dimension} ;;
    drill_fields: [ticket_list*,first_reply_time_average]
    description: "First Reply Time in Minutes"
    value_format: "# ##0 \" Min\""
  }

  dimension: reopens_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."REOPENS" ;;
  }

  dimension: replies_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."REPLIES" ;;
  }

  dimension: resolution_time_business_m_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."RESOLUTION_TIME_BUSINESS_M" ;;
  }

  dimension: resolution_time_total_m_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."RESOLUTION_TIME_TOTAL_M" ;;
  }

  measure: resolution_time_avg_h {
    label: "Resolution Hrs"
    type: average
    sql: ${resolution_time_total_m_dimension}/60 ;;
    drill_fields: [ticket_list*,resolution_time_avg_h]
    description: "Resolution Time in Hours"
    value_format: "# ##0 \" Hrs\""
    }

  dimension: score {
    type: string
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

  dimension: ticket_subject {
    type: string
    sql: ${TABLE}."TICKET_SUBJECT" ;;
  }

  dimension: sla_status {
    type: string
    case: {
      when: {
        label: "Response Violation"
        sql: ${first_reply_time_business_m_dimension} > @{sla_response_minutes} ;;
      }
      when: {
        label: "Response Violation"
        sql: ${status} = 'new' AND ${minutes_since_open} > @{sla_response_minutes} ;;
      }
      when: {
        label: "Resolution Violation"
        sql: ${resolution_time_business_m_dimension}/60 > @{sla_resolution_hours} ;;
      }
      when: {
        label: "Resolution Violation"
        sql: ${status} NOT IN ('closed','solved','deleted') AND ${hours_since_open} > @{sla_resolution_hours} ;;
      }
      else: "OK"
    }
    drill_fields: [ticket_list*]
  }

  dimension: activity_status {
    type: string
    case: {
      when: {
        label: "Stale"
        sql: ${status} NOT IN ('closed','solved','deleted') AND ${hours_since_update} > @{stale_after_hours} ;;
      }
      when: {
        label: "Closed"
        sql: ${status} IN ('closed','solved','deleted');;
      }
      else: "Active"
    }
    drill_fields: [ticket_list*]
  }

  measure: tickets_total {
    type: count
    drill_fields: [ticket_list*]
  }

  measure: tickets_open {
    type: count
    filters: {
      field: status
      value: "new, open, pending"
    }
    drill_fields: [ticket_list*,tickets_open]
  }

  measure: tickets_new {
    type: count
    filters: {
      field: status
      value: "new"
    }
    drill_fields: [ticket_list*]
  }

  measure: tickets_sla_violations {
    type: count
    filters: {
      field: sla_status
      value: "Response Violation, Resolution Violation"
    }
    drill_fields: [ticket_list*,sla_status]
  }

  measure: no_of_evaluated_tickets {
    label: "No. of Evaluated Tickets"
    type: count
    filters: {
      field: score
      value: "good,bad"
    }
    drill_fields: [ticket_list*]
  }

  measure: no_of_good_evaluations {
    label: "No. of Good Evaluations"
    type: count
    filters: {
      field: score
      value: "good"
    }
    drill_fields: [ticket_list*]
  }

  measure: no_of_bad_evaluations {
    label: "No. of Bad Evaluations"
    type: number
    sql: ${no_of_evaluated_tickets}-${no_of_good_evaluations};;
    value_format: "#."
    drill_fields: [ticket_list*]
  }

  measure: good_evaluations_ratio {
    type: number
    sql: ${no_of_good_evaluations}/${no_of_evaluated_tickets} ;;
    value_format: "0%"
    drill_fields: [ticket_list*]
  }

  set: ticket_list {
    fields: [
      ticket_id, company.company, customer.customer, ticket_subject,created_date,status
    ]
  }
}
