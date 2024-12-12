## **Summary of Evaluator Best Practices**  
| **Sort** | **Type** | **Name** | **Number of Opportunities** |  
|:---:|:---:|:---:|:---:|  
|00|Documentation|Documentation Coverage|1|  
|01|Documentation|Undocumented Models|722|  
|02|Documentation|Undocumented Source Tables|342|  
|03|Documentation|Undocumented Sources|29|  
|04|Governance|Exposures Dependent on Private Models|126|  
|05|Governance|Public models without contracts|0|  
|06|Governance|Undocumented Public Models|0|  
|07|Modeling|Direct Join to Source|25|  
|08|Modeling|Downstream Models Dependent on Source|0|  
|09|Modeling|Duplicate Sources|0|  
|10|Modeling|Hard Coded References|63|  
|11|Modeling|Model Fanout|35|  
|12|Modeling|Models with Too Many Joins|23|  
|13|Modeling|Multiple Sources Joined|15|  
|14|Modeling|Rejoining of Upstream Concepts|6|  
|15|Modeling|Root Models|4|  
|16|Modeling|Source Fanout|12|  
|17|Modeling|Staging Models Dependent on Downstream Models|1|  
|18|Modeling|Staging Models Dependent on Other Staging Models|608|  
|19|Modeling|Unused Sources|64|  
|20|Performance|Chained View Dependencies|459|  
|21|Performance|Exposure Parents Materializations|17|  
|22|Structure|Model Directories|553|  
|23|Structure|Model Naming Conventions|508|  
|24|Structure|Source Directories|372|  
|25|Structure|Test Directories|47|  
|26|Testing|Missing Primary Key Tests|743|  
|27|Testing|Test Coverage|1|  

*Note: Many Git providers will show a table of contents of this markdown document.*  
## **00. Best Practice:** Documentation Coverage  
**Finding:**  Not all models have descriptions.  
**Risk:** Makes it harder for others to understand the models.  
**Best Practice:**  Add descriptions to models using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#documentation-coverage)  
#### Showing  1 of 1  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_documentation_coverage )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_documentation_coverage  
~~~  
|  **MEASURED_AT** | **TOTAL_MODELS** | **DOCUMENTED_MODELS** | **DOCUMENTATION_COVERAGE_PCT** | **BASE_DOCUMENTATION_COVERAGE_PCT** | **STAGING_DOCUMENTATION_COVERAGE_PCT** | **INTERMEDIATE_DOCUMENTATION_COVERAGE_PCT** | **MARTS_DOCUMENTATION_COVERAGE_PCT** | **OTHER_DOCUMENTATION_COVERAGE_PCT** |  
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|  
|2024-12-11 17:26:57.740 Z|820|98|11.95| |9.32|10.00| |20.53|
 ---  
## **01. Best Practice:** Undocumented Models  
**Finding:**  Models lack descriptions.  
**Risk:** Hinders understanding and discoverability of models.  
**Best Practice:**  Add descriptions to models using YAML or docs blocks. Prioritize marts models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-models)  
#### Showing  10 of 722  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_undocumented_models )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_undocumented_models  
~~~  
|  **RESOURCE_NAME** | **MODEL_TYPE** |  
|:---|:---|  
|DVT_Sample_Data|staging|
|Auto_Focus_metrics_per_tile|staging|
|Side_A_Thermal_Incubation_Accuracy_V1_Summary|staging|
|Side_A_Thermal_Incubation_Accuracy_V1_New_Pipe|staging|
|Semi_Fin_Thermal_Ramp|staging|
|Motion_Step_Settle_Analysis|staging|
|MVP_TILE_DATA|staging|
|MVP_Instrument_Runs|staging|
|Fin_pressure_avg|staging|
|Fin_Thermal_Incubation_Accuracy|staging|
 ---  
## **02. Best Practice:** Undocumented Source Tables  
**Finding:**  Source tables lack descriptions.  
**Risk:** Makes it harder to understand the source data.  
**Best Practice:**  Add descriptions to source tables using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-source-tables)  
#### Showing  10 of 342  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_undocumented_source_tables )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_undocumented_source_tables  
~~~  
|  **RESOURCE_NAME** |  
|:---|  
|opcenter_odsdb.ismanageinventoryhistorydetail|
|opcenter_odsdb.ismanageinventoryhistory|
|opcenter_odsdb.isinventorylocation|
|opcenter_odsdb.isinventorydetails|
|opcenter_odsdb.holdreleasehistorydetail|
|opcenter_odsdb.holdreason|
|opcenter_odsdb.historymainline|
|opcenter_odsdb.historycrossref|
|opcenter_odsdb.factory|
|opcenter_odsdb.holdreleasehistory|
 ---  
## **03. Best Practice:** Undocumented Sources  
**Finding:**  Sources lack descriptions.  
**Risk:** Makes it harder to understand how data is loaded into the warehouse.  
**Best Practice:**  Add descriptions to sources using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-sources)  
#### Showing  10 of 29  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_undocumented_sources )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_undocumented_sources  
~~~  
|  **SOURCE_NAME** |  
|:---|  
|arena|
|iar|
|admin_tables|
|sharepoint|
|seq_db|
|raw|
|opcenter_opcndb|
|jira_tables|
|pardot|
|googleanalytics|
 ---  
## **04. Best Practice:** Exposures Dependent on Private Models  
**Finding:**  Exposures reference private models.  
**Risk:** Exposures should reference trusted, public, and contracted data sources.  
**Best Practice:**  Change the access configuration of the referenced models to public. Consider adding contracts and full documentation to these models as well.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#exposures-dependent-on-private-models)  
#### Showing  10 of 126  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_exposures_dependent_on_private_models )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_exposures_dependent_on_private_models  
~~~  
|  **EXPOSURE_NAME** | **PARENT_RESOURCE_NAME** | **PARENT_ACCESS** | **PARENT_RESOURCE_TYPE** |  
|:---|:---|:---|:---|  
|Top_Performing_Marketing_Leads|marketing_leads|protected|model|
|Lead_Creation_and_Conversion|marketing_leads|protected|model|
|Lead_Creation_and_Conversion|marketing_opportunities|protected|model|
|Marketing_contribution_Opportunities|marketing_opportunities|protected|model|
|Top_Performing_Marketing_Leads|marketing_opportunities|protected|model|
|Website_Analytics_Summary|marketing_website_daily_visitors|protected|model|
|Results_of_Ad_Campaigns|marketing_website_form_submits|protected|model|
|Website_Analytics|marketing_website_form_submits|protected|model|
|Website_Analytics_Summary|marketing_website_form_submits|protected|model|
|Website_Analytics|marketing_daily_website_views|protected|model|
 ---  
## **05. Best Practice:** Public models without contracts  
**Finding:**  Public models lack contracts.  
**Risk:** No guarantees about data types or columns for downstream consumers.  
**Best Practice:**  Add the contract configuration to public models and specify data types and columns.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#public-models-without-contracts)  
#### This best practice is being followed.  
 ---  
## **06. Best Practice:** Undocumented Public Models  
**Finding:**  Public models lack complete documentation (model and column descriptions).  
**Risk:** Reduces usability for downstream consumers.  
**Best Practice:**  Add a model description and descriptions for each column in public models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#undocumented-public-models)  
#### This best practice is being followed.  
 ---  
## **07. Best Practice:** Direct Join to Source  
**Finding:**  Models join directly to sources when a staging model exists.  
**Risk:** Inconsistent transformation logic; duplicated code.  
**Best Practice:**  Create a staging model and have other models reference it.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#direct-join-to-source)  
#### Showing  10 of 25  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_direct_join_to_source )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_direct_join_to_source  
~~~  
|  **PARENT** | **PARENT_RESOURCE_TYPE** | **CHILD** | **CHILD_RESOURCE_TYPE** | **DISTANCE** |  
|:---|:---|:---|:---|:---:|  
|INSTRUMENT_RUNS.INGEST_RAW|source|s3_runs_inventory|model|1|
|salesforce_tables.REGION_C|source|stg_salesforce_regions|model|1|
|stg_salesforce_users|model|stg_salesforce_region_owners|model|1|
|salesforce_tables.REGION_OWNER_C|source|stg_salesforce_region_owners|model|1|
|salesforce_tables.ACCOUNT|source|stg_salesforce_opportunities|model|1|
|stg2_netsuite_country_region_codes|model|stg_salesforce_opportunities|model|1|
|raw_salesforce_opportunity_stage_percent|seed|stg_salesforce_opportunities|model|1|
|raw_salesforce_opportunities|model|stg_salesforce_opportunities|model|1|
|netsuite_state_codes|seed|stg_salesforce_opportunities|model|1|
|stg_s3_run_inventory_keep|model|s3_runs_inventory|model|1|
 ---  
## **08. Best Practice:** Downstream Models Dependent on Source  
**Finding:**  Marts/intermediate models depend directly on sources.  
**Risk:** Violates the principle of staging models as the atomic unit of data modeling.  
**Best Practice:**  Add a staging model between the source and downstream model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#downstream-models-dependent-on-source)  
#### This best practice is being followed.  
 ---  
## **09. Best Practice:** Duplicate Sources  
**Finding:**  Multiple source nodes defined for the same database object.  
**Risk:** Inaccurate lineage.  
**Best Practice:**  Combine duplicate source nodes into one.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#duplicate-sources)  
#### This best practice is being followed.  
 ---  
## **10. Best Practice:** Hard Coded References  
**Finding:**  Using hard-coded table/view names instead of ref() and source().  
**Risk:** dbt can't infer dependencies or generate the DAG correctly.  
**Best Practice:**  Replace with ref() for models and source() for raw data.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#hard-coded-references)  
#### Showing  10 of 63  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_hard_coded_references )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_hard_coded_references  
~~~  
|  **MODEL** | **HARD_CODED_REFERENCES** |  
|:---|:---|  
|google_ads__ad_group_report|{{ var('account_history') }}, {{ var('ad_group_history') }}, {{ var('ad_group_stats') }}, {{ var('campaign_history') }}|
|google_ads__account_report|{{ var('account_history') }}, {{ var('account_stats') }}|
|linkedin_ads__creative_report|{{ var('account_history') }}, {{ var('ad_analytics_by_creative') }}, {{ var('campaign_group_history') }}, {{ var('campaign_history') }}, {{ var('creative_history') }}|
|linkedin_ads__campaign_report|{{ var('account_history') }}, {{ var('ad_analytics_by_campaign') }}, {{ var('campaign_group_history') }}, {{ var('campaign_history') }}|
|linkedin_ads__campaign_group_report|{{ var('account_history') }}, {{ var('ad_analytics_by_campaign') }}, {{ var('campaign_group_history') }}, {{ var('campaign_history') }}|
|linkedin_ads__account_report|{{ var('account_history') }}, {{ var('ad_analytics_by_campaign') }}, {{ var('campaign_history') }}|
|google_ads__url_report|{{ var('account_history') }}, {{ var('ad_group_history') }}, {{ var('ad_history') }}, {{ var('ad_stats') }}, {{ var('campaign_history') }}|
|google_ads__keyword_report|{{ var('account_history') }}, {{ var('ad_group_criterion_history') }}, {{ var('ad_group_history') }}, {{ var('campaign_history') }}, {{ var('keyword_stats') }}|
|google_ads__campaign_report|{{ var('account_history') }}, {{ var('campaign_history') }}, {{ var('campaign_stats') }}|
|google_ads__ad_report|{{ var('account_history') }}, {{ var('ad_group_history') }}, {{ var('ad_history') }}, {{ var('ad_stats') }}, {{ var('campaign_history') }}|
 ---  
## **11. Best Practice:** Model Fanout  
**Finding:**  A single model has too many direct children.  
**Risk:** Transformations might be better in the BI layer or consolidated.  
**Best Practice:**  Move transformations to the BI layer or create intermediate models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#model-fanout)  
#### Showing  10 of 35  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_model_fanout )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_model_fanout  
~~~  
|  **PARENT** | **PARENT_MODEL_TYPE** | **LEAF_CHILDREN** |  
|:---|:---|:---|  
|telemetry_db.run| |fridge_avg_hourly_perRun, pressure_sensors_query_perhourrun, therm_avg_hourlyper_run, thermal_ramp_perCycle|
|stg_salesforce_opportunity_lines|staging|opportunity_forecast, sales_orders_invoiced, tableau_sales_opportunity_lines|
|stg2_netsuite_transactions|staging|bills, finance_purchase_orders, finance_requisitions, inventory_adjustments, item_fufillments, operation_bills, po_receipt, purchase_orders, sales_orders|
|stg_salesforce_assets|staging|certified_instruments, service_instruments, stg_instrumentrun_summaries, stg_salesforce_time_entry_v2, stg_salesforce_work_order_lines|
|stg_arena_items|staging|arena_bom_first_level, arena_bom_flat, arena_bom_indented, item_specs, standard_cost_with_floor_stock|
|raw_netsuite_location|staging|item_fulfillment_details, item_shipments, sales_orders_invoiced|
|stg_netsuite_transactionshippingaddress|staging|item_shipments, sales_orders, sales_orders_invoiced|
|INSTRUMENT_RUNS.INGEST_RAW| |stg_instrumentrun_events, stg_instrumentruns_cycle_error_rates, stg_instrumentruns_cycles, stg_runids|
|stg_netsuite_employee|staging|item_shipments, netsuite_employees, netsuite_users, sales_orders_invoiced|
|stg_netsuite_transaction|staging|item_shipments, sales_orders_invoiced, scrap_amount|
 ---  
## **12. Best Practice:** Models with Too Many Joins  
**Finding:**  Models have excessive joins.  
**Risk:** Increased complexity; harder to understand and maintain.  
**Best Practice:**  Break down complex models into smaller ones.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#models-with-too-many-joins)  
#### Showing  10 of 23  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_too_many_joins )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_too_many_joins  
~~~  
|  **RESOURCE_NAME** | **FILE_PATH** | **JOIN_COUNT** |  
|:---|:---|:---:|  
|stg_opcenter_componentissuehistory|models/staging/opcenter/stg_opcenter_componentissuehistory.sql|8|
|stg_netsuite_transaction|models/staging/netsuite/stg_netsuite_transaction.sql|9|
|stg_netsuite_budgets|models/staging/netsuite/stg_netsuite_budgets.sql|7|
|sales_orders_invoiced|models/production/operations/sales_orders_invoiced.sql|9|
|stg_opcenter_componentremovehistory|models/staging/opcenter/stg_opcenter_componentremovehistory.sql|8|
|int_telemetry_v2_instrument_runs|models/staging/telemetry_v2/telemetry_v2_intermediate/int_telemetry_v2_instrument_runs.sql|7|
|item_shipments|models/production/operations/item_shipments.sql|9|
|opcenter_container_history|models/production/operations/opcenter_container_history.sql|19|
|stg_opcenter_container|models/staging/opcenter/stg_opcenter_container.sql|7|
|stg_jira_issue_multiselect_history|models/staging/JIRA/stg_jira_issue_multiselect_history.sql|7|
 ---  
## **13. Best Practice:** Multiple Sources Joined  
**Finding:**  A single staging model joins data from multiple sources.  
**Risk:** Violates the one-to-one relationship between staging models and sources.  
**Best Practice:**  Create separate staging models for each source, then join them in an intermediate model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#multiple-sources-joined)  
#### Showing  10 of 15  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_multiple_sources_joined )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_multiple_sources_joined  
~~~  
|  **CHILD** | **SOURCE_PARENTS** |  
|:---|:---|  
|raw_opcenter_billofprocess|opcenter_odsdb.billofprocess, opcenter_odsdb.billofprocessbase|
|raw_opcenter_tasklist|opcenter_odsdb.tasklist, opcenter_odsdb.tasklistbase|
|thermal_ramp_perCycle|AVITI_STATS.VALUES_LOG, telemetry_db.run|
|raw_opcenter_erproute|opcenter_odsdb.erproute, opcenter_odsdb.erproutebase|
|raw_opcenter_datacollectiondef|opcenter_odsdb.datacollectiondef, opcenter_odsdb.datacollectiondefbase|
|raw_opcenter_electronicprocedure|opcenter_odsdb.electronicprocedure, opcenter_odsdb.electronicprocedurebase|
|raw_opcenter_workflow|opcenter_odsdb.workflow, opcenter_odsdb.workflowbase|
|stg_salesforce_opportunity_lines|salesforce_tables.OPPORTUNITY, salesforce_tables.OPPORTUNITY_LINE_ITEM|
|raw_opcenter_product|opcenter_odsdb.product, opcenter_odsdb.productbase|
|raw_opcenter_printerlabeldefinition|opcenter_odsdb.printerlabeldefinition, opcenter_odsdb.printerlabeldefinitionbase|
 ---  
## **14. Best Practice:** Rejoining of Upstream Concepts  
**Finding:**  A model joins data already joined upstream, creating a "loop" in the DAG.  
**Risk:** Unnecessary complexity and potential performance issues.  
**Best Practice:**  Consolidate logic into a single model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#rejoining-of-upstream-concepts)  
#### Showing  6 of 6  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_rejoining_of_upstream_concepts )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_rejoining_of_upstream_concepts  
~~~  
|  **PARENT** | **CHILD** | **PARENT_AND_CHILD** | **IS_LOOP_INDEPENDENT** |  
|:---|:---|:---|:---:|  
|stg_pardot__list|pardot__lists|int__activities_by_list|true|
|int_netsuite2__accounts|int_netsuite2__tran_with_converted_amounts|int_netsuite2__acctxperiod_exchange_rate_map|true|
|DVT_Sample_Data|stg1_pressure_analysis_Side_A|stg1_avg_pressure_A_values_log|true|
|raw_values_logs_v2|stg1_pressure_analysis_Side_B|stg1_avg_pressure_B_values_log|true|
|stg_salesforce_users|stg_salesforce_accounts|stg_salesforce_account_teams|true|
|stg_salesforce_accounts_new|stg_salesforce_opportunity_lines_new|stg_salesforce_opportunities_new|true|
 ---  
## **15. Best Practice:** Root Models  
**Finding:**  Models have no defined parents.  
**Risk:** dbt can't interpret lineage, potentially leading to errors.  
**Best Practice:**  Ensure all models use ref() and source() to define dependencies.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#root-models)  
#### Showing  4 of 4  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_root_models )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_root_models  
~~~  
|  **CHILD** |  
|:---|  
|dbt_results|
|certified_material_movement|
|tableau_marketing_campaign_detail|
|tableau_marketing_campaign_summary|
 ---  
## **16. Best Practice:** Source Fanout  
**Finding:**  A single source has multiple direct child models.  
**Risk:** Duplicates transformation logic; harder to update if the source changes.  
**Best Practice:**  Create a single staging model for each source and have other models reference it.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#source-fanout)  
#### Showing  10 of 12  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_source_fanout )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_source_fanout  
~~~  
|  **PARENT** | **MODEL_CHILDREN** |  
|:---|:---|  
|salesforce_tables.OPPORTUNITY_LINE_ITEM|raw_salesforce_opportunity_lines_new, stg_salesforce_opportunity_lines|
|salesforce_tables.OPPORTUNITY|raw_salesforce_opportunities, raw_salesforce_opportunities_new, stg_salesforce_opportunity_lines|
|salesforce_tables.PRODUCT_REQUEST|raw_salesforce_product_requests, raw_salesforce_product_requests_new|
|salesforce_tables.ACCOUNT|raw_salesforce_accounts, stg_salesforce_opportunities|
|AVITI_STATS.VALUES_LOG|Fin_Thermal_Incubation_Accuracy, Fin_pressure_avg, Semi_Fin_Thermal_Ramp, fridge_avg_hourly_perRun, fridge_temps, pressure_sensors_query_perhourrun, raw_values_logs, therm_avg_hourlyper_run, thermal_ramp_perCycle|
|salesforce_tables.PRODUCT_REQUEST_LINE_ITEM|raw_salesforce_product_request_line_items, raw_salesforce_product_request_line_items_new|
|telemetry_tables.INGEST|stg_telemetry_runs, temp|
|INSTRUMENT_RUNS.INGEST_RAW|s3_runs_inventory, stg_instrumentrun_events, stg_instrumentruns, stg_instrumentruns_cycle_error_rates, stg_instrumentruns_cycles, stg_instrumentruns_q30, stg_instrumentruns_v2, stg_runids, stg_telemetry_run_details|
|salesforce_tables.QUOTE|raw_salesforce_quote_new, raw_salesforce_quotes|
|salesforce_tables.USER|raw_salesforce_user_new, raw_salesforce_users|
 ---  
## **17. Best Practice:** Staging Models Dependent on Downstream Models  
**Finding:**  Staging models depend on intermediate or marts models.  
**Risk:** Violates the principle that staging models should only select from sources.  
**Best Practice:**  Rename or reconfigure the model to depend on sources.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#staging-models-dependent-on-downstream-models)  
#### Showing  1 of 1  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_staging_dependent_on_marts_or_intermediate )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_staging_dependent_on_marts_or_intermediate  
~~~  
|  **PARENT** | **PARENT_MODEL_TYPE** | **CHILD** | **CHILD_MODEL_TYPE** |  
|:---|:---|:---|:---|  
|int_telemetry_v2_instrument_runs|intermediate|stg_instrumentrun_summaries_v2|staging|
 ---  
## **18. Best Practice:** Staging Models Dependent on Other Staging Models  
**Finding:**  Staging models depend on other staging models.  
**Risk:** Indicates potential misnaming or incorrect dependencies.  
**Best Practice:**  Rename or reconfigure the model to depend on sources or intermediate models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#staging-models-dependent-on-other-staging-models)  
#### Showing  10 of 608  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_staging_dependent_on_staging )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_staging_dependent_on_staging  
~~~  
|  **PARENT** | **PARENT_MODEL_TYPE** | **CHILD** | **CHILD_MODEL_TYPE** |  
|:---|:---|:---|:---|  
|stg_linkedin_ads__ad_analytics_by_campaign_tmp|staging|stg_linkedin_ads__ad_analytics_by_campaign|staging|
|stg_linkedin_ads__ad_analytics_by_creative_tmp|staging|stg_linkedin_ads__ad_analytics_by_creative|staging|
|stg_linkedin_ads__ad_analytics_by_campaign|staging|test_linkedin_stg_model_ref|staging|
|stg_linkedin_ads__account_history_tmp|staging|stg_linkedin_ads__account_history|staging|
|stg_instrumentruns_v2|staging|stg_instrumentruns_dispositioned|staging|
|stg_instrumentruns_q30|staging|stg_instrumentrun_summaries|staging|
|stg_instrumentruns_q30|staging|stg_instrumentrun_summaries_v2|staging|
|stg_instrumentruns_dispositioned|staging|stg_instrumentrun_summaries_v2|staging|
|stg_instrumentruns|staging|stg_instrumentrun_summaries|staging|
|stg_google_ads__keyword_stats_tmp|staging|stg_google_ads__keyword_stats|staging|
 ---  
## **19. Best Practice:** Unused Sources  
**Finding:**  Sources are defined in YAML but not used.  
**Risk:** Unnecessary clutter.  
**Best Practice:**  Remove unused sources from the YAML file.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#unused-sources)  
#### Showing  10 of 64  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_unused_sources )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_unused_sources  
~~~  
|  **PARENT** |  
|:---|  
|sharepoint_finance.budget_v_2_acct_group|
|opcenter_odsdb.portalmenuitem|
|opcenter_odsdb.workcenter|
|opcenter_odsdb.defecthistory|
|opcenter_odsdb.bonusreason|
|opcenter_odsdb.resourcedef|
|jira_tables.STATUS_CATEGORY|
|arena.training_summary|
|arena.quality_custom_attributes|
|opcenter_odsdb.resourcefamily|
 ---  
## **20. Best Practice:** Chained View Dependencies  
**Finding:**  Models depend on long chains of views or ephemeral models.  
**Risk:** Can lead to long runtimes due to nested queries.  
**Best Practice:**  Change the materialization of some upstream models to table or incremental. Prioritize views used by many models or those with complex calculations.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/performance/#chained-view-dependencies)  
#### Showing  10 of 459  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_chained_views_dependencies )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_chained_views_dependencies  
~~~  
|  **PARENT** | **CHILD** | **DISTANCE** | **PATH** |  
|:---|:---|:---:|:---|  
|raw_salesforce_users|order_fulfillment_details|6|["raw_salesforce_users","stg_salesforce_users","stg_salesforce_opportunity_lines","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","order_fulfillment_details"]|
|raw_salesforce_pricebook|stg_salesforce_cases_lvl2|6|["raw_salesforce_pricebook","stg_salesforce_pricebook","stg_salesforce_accounts","stg_salesforce_assets","stg_salesforce_time_entry","stg_salesforce_instrument_failures","stg_salesforce_cases_lvl2"]|
|raw_salesforce_pricebook|certified_sales_orders|6|["raw_salesforce_pricebook","stg_salesforce_pricebook","stg_salesforce_accounts","stg_salesforce_opportunity_lines","stg2_salesforce_opp_and_req_lines","int_sales_order_details","certified_sales_orders"]|
|raw_salesforce_pricebook|commercial_sales_order_details|6|["raw_salesforce_pricebook","stg_salesforce_pricebook","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","commercial_sales_order_details"]|
|raw_salesforce_pricebook|item_fulfillment_details|6|["raw_salesforce_pricebook","stg_salesforce_pricebook","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","item_fulfillment_details"]|
|raw_salesforce_pricebook|int_order_fufillment_details|6|["raw_salesforce_pricebook","stg_salesforce_pricebook","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details"]|
|raw_salesforce_accounts|stg_instrument_failures|6|["raw_salesforce_accounts","stg_salesforce_accounts","stg_salesforce_assets","stg_salesforce_time_entry","stg_salesforce_instrument_failures","stg_salesforce_cases_lvl2","stg_instrument_failures"]|
|raw_salesforce_users|commercial_order_fufillment_details|6|["raw_salesforce_users","stg_salesforce_users","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","commercial_order_fufillment_details"]|
|raw_salesforce_users|commercial_sales_order_details|6|["raw_salesforce_users","stg_salesforce_users","stg_salesforce_accounts","stg_salesforce_opportunity_lines","stg2_salesforce_opp_and_req_lines","int_sales_order_details","commercial_sales_order_details"]|
|raw_netsuite_assemblyitemlocations|int_order_fufillment_details|6|["raw_netsuite_assemblyitemlocations","stg_netsuite_aggregateitemlocations","stg2_netsuite_items","stg2_netsuite_transaction_lines","stg2_netsuite_sales_order_details","int_sales_order_details","int_order_fufillment_details"]|
 ---  
## **21. Best Practice:** Exposure Parents Materializations  
**Finding:**  Exposures reference sources or models that are not materialized as tables.  
**Risk:** Exposures should reference transformed data, and their parents should be performant for downstream use.  
**Best Practice:**  If referencing a source, incorporate the data into a model. Change the materialization of model parents to table or incremental.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/performance/#exposure-parents-materializations)  
#### Showing  10 of 17  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_exposure_parents_materializations )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_exposure_parents_materializations  
~~~  
|  **PARENT_RESOURCE_TYPE** | **PARENT_RESOURCE_NAME** | **EXPOSURE_NAME** | **PARENT_MODEL_MATERIALIZATION** |  
|:---|:---|:---|:---|  
|model|tableau_instrument_service_metrics|Executive_Dashboard_TableauMetric|view|
|model|tableau_instrument_run_inventory|AWS_Instrument_Data_Storage_Costs|view|
|model|tableau_instruments|Executive_Dashboard_TableauMetric|view|
|model|tableau_instrumentrun_summaries|Executive_Dashboard_TableauMetric|view|
|model|service_end_customers|Customer_Fleet_Metrics|view|
|model|service_end_customers|Service_metric|view|
|model|commercial_end_customers|OTIF_metric|view|
|model|tableau_a30_open_opportunities|A360_Dashboard|view|
|model|service_end_customers|Executive_Dashboard_serviceMetric|view|
|model|tableau_instrumentrun_summaries|AWS_Cost_By_Service|view|
 ---  
## **22. Best Practice:** Model Directories  
**Finding:**  Models are not in the correct subdirectory.  
**Risk:** Poor organization makes it hard to find models.  
**Best Practice:**  Move staging models to a subfolder matching their source. Nest other models closest to the folder matching their type.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#model-directories)  
#### Showing  10 of 553  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_model_directories )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_model_directories  
~~~  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **MODEL_TYPE** | **CURRENT_FILE_PATH** | **CHANGE_FILE_PATH_TO** |  
|:---|:---|:---|:---|:---|  
|stg3_s3_aws_costs|model|staging|models/staging/snowpipe/stg3_s3_aws_costs.sql|models/staging/raw/stg3_s3_aws_costs.sql|
|raw_opcenter_mio_logmessagecontents|model|staging|models/staging/opcenter/raw_opcenter_mio_logmessagecontents.sql|models/staging/opcenter_opcndb/raw_opcenter_mio_logmessagecontents.sql|
|raw_opcenter_sampletest|model|staging|models/staging/opcenter/raw_opcenter_sampletest.sql|models/staging/opcenter_odsdb/raw_opcenter_sampletest.sql|
|alt_opcenter_container_history|model|staging|models/staging/opcenter/alt_opcenter_container_history.sql|models/staging/opcenter_odsdb/alt_opcenter_container_history.sql|
|stg2_netsuite_items|model|staging|models/staging/netsuite/stg2_netsuite_items.sql|models/staging/netsuite_tables_v2/stg2_netsuite_items.sql|
|stg2_netsuite_transaction_lines|model|staging|models/staging/netsuite/stg2_netsuite_transaction_lines.sql|models/staging/netsuite_tables_v2/stg2_netsuite_transaction_lines.sql|
|raw_salesforce_opportunity_lines_new|model|staging|models/staging/salesforce/raw/raw_salesforce_opportunity_lines_new.sql|models/staging/salesforce_tables/raw_salesforce_opportunity_lines_new.sql|
|stg2_salesforce_opp_and_req_lines|model|staging|models/staging/salesforce/stg2_salesforce_opp_and_req_lines.sql|models/staging/salesforce_tables/stg2_salesforce_opp_and_req_lines.sql|
|stg_salesforce_opportunity_lines|model|staging|models/staging/salesforce/stg_salesforce_opportunity_lines.sql|models/staging/salesforce_tables/stg_salesforce_opportunity_lines.sql|
|raw_netsuite_bom|model|staging|models/staging/netsuite/raw/raw_netsuite_bom.sql|models/staging/netsuite_tables_v2/raw_netsuite_bom.sql|
 ---  
## **23. Best Practice:** Model Naming Conventions  
**Finding:**  Models don't have the correct prefix (e.g., stg_, int_, fct_, dim_).  
**Risk:** Confusing for users; model type isn't clear.  
**Best Practice:**  Add the appropriate prefix to model names.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#model-naming-conventions)  
#### Showing  10 of 508  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_model_naming_conventions )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_model_naming_conventions  
~~~  
|  **RESOURCE_NAME** | **PREFIX** | **MODEL_TYPE** | **APPROPRIATE_PREFIXES** |  
|:---|:---|:---|:---|  
|Fin_Thermal_Incubation_Accuracy|Fin_|staging|stg_|
|Side_A_Thermal_Incubation_Accuracy_V1_Summary|Side_|staging|stg_|
|Side_A_Thermal_Incubation_Accuracy_V1_New_Pipe|Side_|staging|stg_|
|Semi_Fin_Thermal_Ramp|Semi_|staging|stg_|
|Motion_Step_Settle_Analysis|Motion_|staging|stg_|
|MVP_TILE_DATA|MVP_|staging|stg_|
|MVP_Instrument_Runs|MVP_|staging|stg_|
|Fin_pressure_avg|Fin_|staging|stg_|
|DVT_Sample_Data|DVT_|staging|stg_|
|Auto_Focus_metrics_per_tile|Auto_|staging|stg_|
 ---  
## **24. Best Practice:** Source Directories  
**Finding:**  Source definitions are not in the correct subdirectory.  
**Risk:** Makes it harder to find and manage source definitions.  
**Best Practice:**  Move source definitions to a YAML file in the subdirectory matching the source.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#source-directories)  
#### Showing  10 of 372  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_source_directories )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_source_directories  
~~~  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **CURRENT_FILE_PATH** | **CHANGE_FILE_PATH_TO** |  
|:---|:---|:---|:---|  
|AVITI_STATS.CYCLESTATSLANESUMMARY_CSV|source|models/staging/sources.yml|models/staging/AVITI_STATS/sources.yml|
|pardot.visitor_activity|source|models/src_pardot.yml|models/staging/pardot/src_pardot.yml|
|arena.changes_custom_attributes|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|admin_tables.STORAGE_USAGE|source|models/staging/sources.yml|models/staging/admin_tables/sources.yml|
|admin_tables.METERING_DAILY_HISTORY|source|models/staging/sources.yml|models/staging/admin_tables/sources.yml|
|admin_tables.COPY_HISTORY|source|models/staging/sources.yml|models/staging/admin_tables/sources.yml|
|admin_tables.ACCESS_HISTORY|source|models/staging/sources.yml|models/staging/admin_tables/sources.yml|
|INSTRUMENT_RUNS.INGEST_RAW|source|models/staging/telemetry/telemtry_sources.yml|models/staging/INSTRUMENT_RUNS/telemtry_sources.yml|
|AVITI_STATS.VALUES_LOG|source|models/staging/sources.yml|models/staging/AVITI_STATS/sources.yml|
|AVITI_STATS.RUN_LOG|source|models/staging/sources.yml|models/staging/AVITI_STATS/sources.yml|
 ---  
## **25. Best Practice:** Test Directories  
**Finding:**  Model tests are not in the same directory as the model.  
**Risk:** Disorganized tests make it harder to find and maintain them.  
**Best Practice:**  Move tests to a YAML file in the same directory as the model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#test-directories)  
#### Showing  10 of 47  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_test_directories )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_test_directories  
~~~  
|  **TEST_NAME** | **MODEL_NAME** | **CURRENT_TEST_DIRECTORY** | **CHANGE_TEST_DIRECTORY_TO** |  
|:---|:---|:---|:---|  
|not_null_stg_netsuite2__accounts_account_id|stg_netsuite2__accounts|models/|models/netsuite2/|
|not_null_stg_netsuite2__transaction_accounting_lines_transaction_id|stg_netsuite2__transaction_accounting_lines|models/|models/netsuite2/|
|unique_stg_netsuite2__currencies_currency_id|stg_netsuite2__currencies|models/|models/netsuite2/|
|dbt_utils_unique_combination_of_columns_netsuite2__income_statement_transaction_line_id__transaction_id__accounting_period_id__account_name|netsuite2__income_statement|models/|models/netsuite2/|
|not_null_stg_netsuite2__transaction_lines_transaction_line_id|stg_netsuite2__transaction_lines|models/|models/netsuite2/|
|not_null_netsuite2__income_statement_transaction_id|netsuite2__income_statement|models/|models/netsuite2/|
|not_null_stg_netsuite2__departments_department_id|stg_netsuite2__departments|models/|models/netsuite2/|
|not_null_stg_netsuite2__jobs_job_id|stg_netsuite2__jobs|models/|models/netsuite2/|
|dbt_utils_unique_combination_of_columns_stg_netsuite2__transaction_accounting_lines_transaction_id__transaction_line_id|stg_netsuite2__transaction_accounting_lines|models/|models/netsuite2/|
|unique_stg_netsuite2__items_item_id|stg_netsuite2__items|models/|models/netsuite2/|
 ---  
## **26. Best Practice:** Missing Primary Key Tests  
**Finding:**  Models lack tests on their primary keys.  
**Risk:** Risks data reliability and scalability.  
**Best Practice:**  Apply not_null, unique, or unique_combination_of_columns tests to primary keys.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/testing/#missing-primary-key-tests)  
#### Showing  10 of 743  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_missing_primary_key_tests )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_missing_primary_key_tests  
~~~  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **MODEL_TYPE** | **IS_PRIMARY_KEY_TESTED** | **NUMBER_OF_TESTS_ON_MODEL** | **NUMBER_OF_CONSTRAINTS_ON_MODEL** |  
|:---|:---|:---|:---:|:---:|:---:|  
|Fin_pressure_avg|model|staging|false|0|0|
|Side_A_Thermal_Incubation_Accuracy_V1_Summary|model|staging|false|0|0|
|Side_A_Thermal_Incubation_Accuracy_V1_New_Pipe|model|staging|false|0|0|
|Semi_Fin_Thermal_Ramp|model|staging|false|0|0|
|Motion_Step_Settle_Analysis|model|staging|false|0|0|
|MVP_TILE_DATA|model|staging|false|0|0|
|MVP_Instrument_Runs|model|staging|false|0|0|
|Fin_Thermal_Incubation_Accuracy|model|staging|false|0|0|
|DVT_Sample_Data|model|staging|false|0|0|
|Auto_Focus_metrics_per_tile|model|staging|false|0|0|
 ---  
## **27. Best Practice:** Test Coverage  
**Finding:**  Not all models have tests.  
**Risk:** Decreases confidence in data accuracy.  
**Best Practice:**  Apply generic or singular tests to models. Aim for 100% coverage with at least not_null and unique tests on primary keys.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/testing/#test-coverage)  
#### Showing  1 of 1  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_test_coverage )}}  
SELECT * FROM DBT_DEV.dbt_klewen.fct_test_coverage  
~~~  
|  **MEASURED_AT** | **TOTAL_MODELS** | **TOTAL_TESTS** | **TESTED_MODELS** | **TEST_COVERAGE_PCT** | **BASE_TEST_COVERAGE_PCT** | **STAGING_TEST_COVERAGE_PCT** | **INTERMEDIATE_TEST_COVERAGE_PCT** | **MARTS_TEST_COVERAGE_PCT** | **OTHER_TEST_COVERAGE_PCT** | **TEST_TO_MODEL_RATIO** |  
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|  
|2024-12-11 17:26:57.740 Z|820|179|80|9.76| |8.81|2.50| |14.21|0.2183|
