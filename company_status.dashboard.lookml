- dashboard: company_status
  title: Company Status
  layout: newspaper
  elements:
  - title: Ticket Creation and Feedback
    name: Ticket Creation and Feedback
    model: block_keboola_support
    explore: ticket
    type: looker_column
    fields: [ticket.score, ticket.created_month, ticket.tickets_total]
    pivots: [ticket.score]
    fill_fields: [ticket.created_month]
    filters:
      ticket.created_month: 12 months
    sorts: [ticket.created_month desc, ticket.score]
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
    listen:
      Company: company.company
    row: 2
    col: 8
    width: 10
    height: 6
  - title: Open Tickets
    name: Open Tickets
    model: block_keboola_support
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
    listen:
      Company: company.company
    row: 5
    col: 0
    width: 4
    height: 3
  - title: Most recent 20 tickets
    name: Most recent 20 tickets
    model: block_keboola_support
    explore: ticket
    type: table
    fields: [ticket.ticket_id, ticket.created_date, ticket.first_reply_time_average,
      customer.customer, ticket.ticket_subject, ticket.status, ticket.resolution_time_avg_h]
    sorts: [ticket.created_date desc]
    limit: 20
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ticket.tickets_open: Still open
      ticket.tickets_total: Tickets Created
      ticket.first_reply_time_average: First Reply Time
      ticket.resolution_time_avg_h: Resolution Time
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Company: company.company
    row: 8
    col: 0
    width: 24
    height: 10
  - title: Total Raised Tickets
    name: Total Raised Tickets
    model: block_keboola_support
    explore: ticket
    type: single_value
    fields: [ticket.tickets_total]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
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
    listen:
      Company: company.company
    row: 2
    col: 0
    width: 4
    height: 3
  - name: 'powered by'
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://www.keboola.com/data/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - title: NPS Score
    name: NPS Score
    model: block_keboola_support
    explore: ticket
    type: single_value
    fields: [ticket.good_evaluations_ratio]
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
    listen:
      Company: company.company
    row: 2
    col: 4
    width: 4
    height: 3
  - title: SLA Compliance
    name: SLA Compliance
    model: block_keboola_support
    explore: ticket
    type: single_value
    fields: [ticket.tickets_sla_violations, ticket.tickets_total]
    limit: 500
    dynamic_fields: [{table_calculation: sla_compliance, label: SLA Compliance, expression: '1-(${ticket.tickets_sla_violations}/${ticket.tickets_total})',
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0.9, background_color: "#ed6168",
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
    hidden_fields: [ticket.tickets_sla_violations, ticket.tickets_total]
    listen:
      Company: company.company
    row: 5
    col: 4
    width: 4
    height: 3
  - name: 'dashboard'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Company Status</b></font>
    body_text: ''
    row: 0
    col: 6
    width: 12
    height: 2
  - title: 'Top Users by # of Tickets'
    name: 'Top Users by # of Tickets'
    model: block_keboola_support
    explore: ticket
    type: looker_bar
    fields: [customer.customer, ticket.tickets_total]
    sorts: [ticket.tickets_total desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: ticket.tickets_total,
            id: ticket.tickets_total, name: Tickets Created}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
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
      ticket.first_reply_time_average: First Reply Time
      ticket.resolution_time_avg_h: Resolution Time
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_null_points: true
    interpolation: linear
    listen:
      Company: company.company
    row: 2
    col: 18
    width: 6
    height: 6
  - name: 'scaffold'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Support Essentials</b></font>
    row: 0
    col: 0
    width: 6
    height: 2
  filters:
  - name: Company
    title: Company
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: true
    model: block_keboola_support
    explore: company
    listens_to_filters: []
    field: company.company
