project_name: "block-keboola-support"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-keboola-support-config"
  export: override_required
}

constant: CONNECTION {
  value: "keboola_block_zendesk"
}

constant: SCHEMA_NAME {
  value: "WORKSPACE_545056555"
}

# the manifest contains constants to be set according to your needs:

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

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
