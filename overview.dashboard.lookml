- dashboard: overview
  title: Overview
  layout: newspaper
  elements:
  - title: Tickets Created and Current Status
    name: Tickets Created and Current Status
    model: zendesk_block
    explore: ticket
    type: looker_area
    fields: [ticket.tickets_open, ticket.tickets_total, ticket.created_date]
    fill_fields: [ticket.created_date]
    filters:
      ticket.created_date: 30 days
    sorts: [ticket.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 10
    col: 0
    width: 8
    height: 6
  - title: Open Tickets
    name: Open Tickets
    model: zendesk_block
    explore: ticket
    type: single_value
    fields: [ticket.tickets_open]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 5
    col: 0
    width: 4
    height: 3
  - title: Open Tickets by Age (days)
    name: Open Tickets by Age (days)
    model: zendesk_block
    explore: ticket
    type: looker_bar
    fields: [ticket.tickets_open, ticket.tickets_aging, ticket.priority]
    pivots: [ticket.priority]
    fill_fields: [ticket.tickets_aging]
    sorts: [ticket.tickets_aging, ticket.priority]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ticket.tickets_open,
            id: ticket.tickets_open, name: Still open}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      high - ticket.tickets_open: "#ed6168"
      unspecified - ticket.tickets_open: "#b9b9b9"
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    row: 2
    col: 8
    width: 16
    height: 6
  - title: Tickets Created by Channel
    name: Tickets Created by Channel
    model: zendesk_block
    explore: ticket
    type: looker_area
    fields: [ticket.tickets_total, ticket.created_date, ticket.channel]
    pivots: [ticket.channel]
    fill_fields: [ticket.created_date]
    filters:
      ticket.created_date: 30 days
    sorts: [ticket.created_date desc, ticket.channel]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: ticket.tickets_total,
            id: email - ticket.tickets_total, name: email}, {axisId: ticket.tickets_total,
            id: web - ticket.tickets_total, name: web}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 10
    col: 8
    width: 8
    height: 6
  - title: Tickets and first response times
    name: Tickets and first response times
    model: zendesk_block
    explore: ticket
    type: looker_area
    fields: [ticket.tickets_total, ticket.created_date, ticket.first_reply_time_average]
    fill_fields: [ticket.created_date]
    filters:
      ticket.created_date: 30 days
    sorts: [ticket.created_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: ticket.tickets_total,
            id: ticket.tickets_total, name: Tickets Created}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}, {
        label: '', orientation: right, series: [{axisId: ticket.first_reply_time_average,
            id: ticket.first_reply_time_average, name: First Reply Time Average}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types:
      ticket.first_reply_time_average: column
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 10
    col: 16
    width: 8
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: Last 30 Days
    row: 8
    col: 0
    width: 24
    height: 2
  - name: 'powered by'
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://www.keboola.com/data/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - name: 'dashboard'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Overview</b></font>
    body_text: ''
    row: 0
    col: 7
    width: 11
    height: 2
  - title: New Tickets
    name: New Tickets
    model: zendesk_block
    explore: ticket
    type: single_value
    fields: [ticket.tickets_new]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 0
    width: 4
    height: 3
  - title: SLA Violations
    name: SLA Violations
    model: zendesk_block
    explore: ticket
    type: single_value
    fields: [ticket.tickets_sla_violations]
    filters:
      ticket.status: new,open,pending
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#ed6168",
        font_color: "#e7e7e7", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 4
    width: 4
    height: 3
  - title: Stale Tickets
    name: Stale Tickets
    model: zendesk_block
    explore: ticket
    type: single_value
    fields: [ticket.tickets_open]
    filters:
      ticket.activity_status: Stale
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#ed6168",
        font_color: "#e7e7e7", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 5
    col: 4
    width: 4
    height: 3
  - title: Resolution Time Trend
    name: Resolution Time Trend
    model: zendesk_block
    explore: ticket
    type: looker_line
    fields: [ticket.resolution_time_avg_h, employee.employee, ticket.created_month]
    pivots: [employee.employee]
    fill_fields: [ticket.created_month]
    filters:
      employee.employee: "-Unknown"
      ticket.created_month: 12 months
    sorts: [ticket.created_month desc, employee.employee]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: ticket.resolution_time_avg_h,
            id: Keboola EU Support - ticket.resolution_time_avg_h, name: Keboola EU
              Support}, {axisId: ticket.resolution_time_avg_h, id: Keboola NA Support
              - ticket.resolution_time_avg_h, name: Keboola NA Support}, {axisId: ticket.resolution_time_avg_h,
            id: Keboola Tech Support - ticket.resolution_time_avg_h, name: Keboola
              Tech Support}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#000000",
        line_value: '48', label: SLA - 48 Hrs}]
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 18
    col: 0
    width: 12
    height: 6
  - title: Resolution Time Trend
    name: Resolution Time Trend
    model: zendesk_block
    explore: ticket
    type: looker_line
    fields: [employee.employee, ticket.created_month, ticket.first_reply_time_average]
    pivots: [employee.employee]
    fill_fields: [ticket.created_month]
    filters:
      employee.employee: "-Unknown"
      ticket.created_month: 12 months
    sorts: [ticket.created_month desc, employee.employee]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: ticket.resolution_time_avg_h,
            id: Keboola EU Support - ticket.resolution_time_avg_h, name: Keboola EU
              Support}, {axisId: ticket.resolution_time_avg_h, id: Keboola NA Support
              - ticket.resolution_time_avg_h, name: Keboola NA Support}, {axisId: ticket.resolution_time_avg_h,
            id: Keboola Tech Support - ticket.resolution_time_avg_h, name: Keboola
              Tech Support}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: left, color: "#000000",
        line_value: '600', label: SLA - 600 Min}]
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 18
    col: 12
    width: 12
    height: 6
  - name: ''
    type: text
    title_text: ''
    subtitle_text: 12 Month Trends
    row: 16
    col: 0
    width: 24
    height: 2
  - name: 'scaffold'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Support Essentials</b></font>
    row: 0
    col: 0
    width: 7
    height: 2
