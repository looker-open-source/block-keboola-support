# Support Essentials by Keboola

## Keboola Blocks Intro (Scaffold Prerequisite)
Looker Blocks powered by Keboola are designed to work in tandem with corresponding Keboola Scaffolds in the Keboola Connection platform. Similar to Blocks in nature, Keboola Scaffolds are templatized use-cases that can be instantly deployed into the Keboola platform, providing the whole data management and processing chain required to populate the Looker dashboards.

## Block Overview
This Block connects to data from Keboola “Support - Looker” Scaffold into Looker. Its purpose is to provide quick out-of-the-box end-to-end integration and functionality to be used either stand-alone or to be combined with other data, into scorecards, etc. In order to set up the Keboola data feed, please contact us: [here](https://get.keboola.com/lookerblocks?block=support).

## Data and Block Structure
The Block contains two LookML dashboards:
*  Support Overview for insight into overall performance and trends, as well as tickets requiring immediate attention
*  Company Detail for a closer look at a specific organization’s history

The underlying model is simple and there is just one explore used - “tickets”.

As a standard, the data gets provided as a connection to Keboola-provided Snowflake, but it can be easily changed to your own DWH of choice during the setup.
