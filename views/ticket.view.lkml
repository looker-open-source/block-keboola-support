view: ticket {
  sql_table_name: "TICKET" ;;
  drill_fields: [ticket_list*]

  dimension: ticket_id {
    label: "Ticket ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."TICKET_ID" ;;
    html: <a href=https://@{domain}/agent/tickets/{{ value }} target="_blank"><font color="blue">{{ value }}</font></a> ;;
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

  dimension: days_open_dimension {
    type: number
    sql: datediff(day,${created_date},current_date()) ;;
  }

  dimension: tickets_aging {
    case: {
      when: {
        label: "30 or more"
        sql: ${days_open_dimension}>30 ;;
      }
      when: {
        label: "15 - 30"
        sql: ${days_open_dimension}<=30 AND ${days_open_dimension} > 14 ;;
      }
      when: {
        label: "8 - 14"
        sql: ${days_open_dimension}<=14 AND ${days_open_dimension} > 7 ;;
      }
      when: {
        label: "2 - 7"
        sql: ${days_open_dimension}<=7 AND ${days_open_dimension} > 1 ;;
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
        sql: ${status} = 'new' AND timediff(minute,TO_TIME(${TABLE}."CREATED_DATE"),current_time()) > @{sla_response_minutes} ;;
      }
      when: {
        label: "Resolution Violation"
        sql: ${resolution_time_business_m_dimension}/60 > @{sla_resolution_hours} ;;
      }
      when: {
        label: "Resolution Violation"
        sql: ${status} NOT IN ('closed','solved','deleted') AND timediff(hour,TO_TIME(${TABLE}."CREATED_DATE"),current_time()) > @{sla_resolution_hours} ;;
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
        sql: ${status} NOT IN ('closed','solved','deleted') AND timediff(hour,TO_TIME(${TABLE}."LAST_UPDATE"),current_time()) > @{stale_after_hours} ;;
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

  set: ticket_list {
    fields: [
      ticket_id, company.company, customer.customer, ticket_subject,created_date,status
    ]
  }
}
