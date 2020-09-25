project_name: "block-keboola-support"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-keboola-support-config"
  export: override_required
}

constant: CONNECTION {
  value: "keboola_block_zendesk"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "WORKSPACE_545056555"
  export: override_required
}

# the manifest contains constants to be set according to your needs:

# tickets with first response later than this will be flagged as SLA violations
constant: sla_response_minutes {
  value: "600"
  export: override_required
}

# tickets with resolution later than this will be flagged as SLA violations
constant: sla_resolution_hours {
  value: "72"
  export: override_required
}

# tickets with longer time since last update than this will be flagged as stale
constant: stale_after_hours {
  value: "48"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }

  override_constant: sla_response_minutes {
    value: "@{sla_response_minutes}"
  }

  override_constant: sla_resolution_hours {
    value: "@{sla_resolution_hours}"
  }

  override_constant: stale_after_hours {
    value: "@{stale_after_hours}"
  }
}
