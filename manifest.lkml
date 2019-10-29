# the manifest contains constants to be set according to your needs:


constant: connection {
  value: "keboola_block_zendesk"
}

# url of your Zendesk domain for ticket links
constant: domain {
  value: "keboola.zendesk.com"
}

# tickets with first response later than this will be flagged as SLA violations
constant: sla_response_minutes {
  value: "600"
}

# tickets with resolution later than this will be flagged as SLA violations
constant: sla_resolution_hours {
  value: "72"
}

# tickets with longer time since last update than this will be flagged as stale
constant: stale_after_hours {
  value: "48"
}
