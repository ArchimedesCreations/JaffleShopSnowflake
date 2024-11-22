## **Summary of Evaluator Rules**  
| **Sort** | **Type** | **Name** | **Number of Opportunities** |  
|:---:|:---:|:---:|:---:|  
|00|Documentation|Documentation Coverage|1|  
|01|Documentation|Undocumented Models|722|  
|02|Documentation|Undocumented Source Tables|342|  
|03|Documentation|Undocumented Sources|29|  
|04|Governance|Exposures Dependent on Private Models|126|  
|05|Governance|Undocumented Public Models|0|  
|06|Modeling|Direct Join to Source|25|  
|07|Modeling|Downstream Models Dependent on Source|0|  
|08|Modeling|Duplicate Sources|0|  
|09|Modeling|Hard Coded References|63|  
|10|Modeling|Model Fanout|35|  
|11|Modeling|Models with Too Many Joins|23|  
|12|Modeling|Multiple Sources Joined|15|  
|13|Modeling|Rejoining of Upstream Concepts|6|  
|14|Modeling|Root Models|4|  
|15|Modeling|Source Fanout|12|  
|16|Modeling|Staging Models Dependent on Downstream Models|1|  
|17|Modeling|Staging Models Dependent on Other Staging Models|608|  
|18|Modeling|Unused Sources|64|  
|19|Performance|Chained View Dependencies|459|  
|20|Performance|Exposure Parents Materializations|17|  
|21|Structure|Model Directories|553|  
|22|Structure|Model Naming Conventions|508|  
|23|Structure|Source Directories|372|  
|24|Structure|Test Directories|47|  
|25|Testing|Missing Primary Key Tests|743|  
|26|Testing|Test Coverage|1|  

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
|2024-11-22 21:15:37.013 Z|820|98|11.95| |9.32|10.00| |20.53|
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
|:---:|:---:|  
|raw_opcenter_esighistorydetail|staging|
|raw_opcenter_esighistorysummary|staging|
|raw_opcenter_executetaskhistory|staging|
|raw_opcenter_esigmeaning|staging|
|raw_opcenter_esigrequirement|staging|
|raw_opcenter_eventdata|staging|
|raw_opcenter_factory|staging|
|raw_opcenter_historycrossref|staging|
|raw_opcenter_historymainline|staging|
|raw_opcenter_holdreason|staging|
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
|:---:|  
|AVITI_STATS.CYCLESTATSLANESUMMARY_CSV|
|AVITI_STATS.RUN_LOG|
|AVITI_STATS.VALUES_LOG|
|INSTRUMENT_RUNS.INGEST_RAW|
|admin_tables.ACCESS_HISTORY|
|admin_tables.COPY_HISTORY|
|admin_tables.METERING_DAILY_HISTORY|
|admin_tables.STORAGE_USAGE|
|arena.changes_custom_attributes|
|arena.changes_decision_history|
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
|:---:|  
|raw|
|netsuite_tables_v2|
|dates|
|googleanalytics|
|INSTRUMENT_RUNS|
|AVITI_STATS|
|opcenter_odsdb|
|seq_db|
|snowpipe_s3_runs_inventory|
|q_shoporder_tables|
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
|:---:|:---:|:---:|:---:|  
|OTIF_metric|commercial_end_customers|protected|model|
|Operations_Tier_3_OTIF_Dashboard|commercial_order_fufillment_details|protected|model|
|My_Requisitions|finance_purchase_orders|protected|model|
|OTIF_metric|commercial_instruments|protected|model|
|OTIF_metric|commercial_order_fufillment_details|protected|model|
|My_Requisitions|finance_requisitions|protected|model|
|Leads_Update_Email_Metrics_Sync|ht_lead_email_updates|protected|model|
|Leads_Update_Sync|ht_lead_ga4_updates|protected|model|
|Website_Analytics_Summary|marketing_daily_website_views|protected|model|
|Lead_Creation_and_Conversion|marketing_leads|protected|model|
 ---  
## **05. Best Practice:** Undocumented Public Models  
**Finding:**  Public models lack complete documentation (model and column descriptions).  
**Risk:** Reduces usability for downstream consumers.  
**Best Practice:**  Add a model description and descriptions for each column in public models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#undocumented-public-models)  
#### This best practice is being followed.  
 ---  
## **06. Best Practice:** Direct Join to Source  
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
|:---:|:---:|:---:|:---:|:---:|  
|stg2_netsuite_country_region_codes|model|stg_salesforce_opportunities|model|1|
|salesforce_tables.ACCOUNT|source|stg_salesforce_opportunities|model|1|
|stg2_netsuite_country_region_codes|model|stg_salesforce_opportunity_lines|model|1|
|stg_salesforce_users|model|stg_salesforce_sales_velocity|model|1|
|stg_salesforce_users|model|stg_salesforce_region_owners|model|1|
|stg_salesforce_users|model|stg_salesforce_opportunities|model|1|
|dates.DATE_DIMENSION|source|stg_salesforce_sales_velocity|model|1|
|stg_salesforce_opportunity_history|model|stg_salesforce_sales_velocity|model|1|
|salesforce_tables.REGION_OWNER_C|source|stg_salesforce_region_owners|model|1|
|salesforce_tables.REGION_C|source|stg_salesforce_regions|model|1|
 ---  
## **07. Best Practice:** Downstream Models Dependent on Source  
**Finding:**  Marts/intermediate models depend directly on sources.  
**Risk:** Violates the principle of staging models as the atomic unit of data modeling.  
**Best Practice:**  Add a staging model between the source and downstream model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#downstream-models-dependent-on-source)  
#### This best practice is being followed.  
 ---  
## **08. Best Practice:** Duplicate Sources  
**Finding:**  Multiple source nodes defined for the same database object.  
**Risk:** Inaccurate lineage.  
**Best Practice:**  Combine duplicate source nodes into one.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#duplicate-sources)  
#### This best practice is being followed.  
 ---  
## **09. Best Practice:** Hard Coded References  
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
|:---:|:---:|  
|google_ads__ad_group_report|{{ var('account_history') }}, {{ var('ad_group_history') }}, {{ var('ad_group_stats') }}, {{ var('campaign_history') }}|
|google_ads__ad_report|{{ var('account_history') }}, {{ var('ad_group_history') }}, {{ var('ad_history') }}, {{ var('ad_stats') }}, {{ var('campaign_history') }}|
|google_ads__keyword_report|{{ var('account_history') }}, {{ var('ad_group_criterion_history') }}, {{ var('ad_group_history') }}, {{ var('campaign_history') }}, {{ var('keyword_stats') }}|
|google_ads__url_report|{{ var('account_history') }}, {{ var('ad_group_history') }}, {{ var('ad_history') }}, {{ var('ad_stats') }}, {{ var('campaign_history') }}|
|linkedin_ads__account_report|{{ var('account_history') }}, {{ var('ad_analytics_by_campaign') }}, {{ var('campaign_history') }}|
|linkedin_ads__campaign_report|{{ var('account_history') }}, {{ var('ad_analytics_by_campaign') }}, {{ var('campaign_group_history') }}, {{ var('campaign_history') }}|
|linkedin_ads__creative_report|{{ var('account_history') }}, {{ var('ad_analytics_by_creative') }}, {{ var('campaign_group_history') }}, {{ var('campaign_history') }}, {{ var('creative_history') }}|
|google_ads__account_report|{{ var('account_history') }}, {{ var('account_stats') }}|
|google_ads__campaign_report|{{ var('account_history') }}, {{ var('campaign_history') }}, {{ var('campaign_stats') }}|
|linkedin_ads__campaign_group_report|{{ var('account_history') }}, {{ var('ad_analytics_by_campaign') }}, {{ var('campaign_group_history') }}, {{ var('campaign_history') }}|
 ---  
## **10. Best Practice:** Model Fanout  
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
|:---:|:---:|:---:|  
|stg_netsuite_transactionshippingaddress|staging|item_shipments, sales_orders, sales_orders_invoiced|
|raw_42q_snapshot|staging|stg_42q_snapshot_attributes, stg_42q_snapshot_components, stg_42q_snapshot_defects, stg_42q_snapshot_measurements|
|stg_netsuite_employee|staging|item_shipments, netsuite_employees, netsuite_users, sales_orders_invoiced|
|INSTRUMENT_RUNS.INGEST_RAW| |stg_instrumentrun_events, stg_instrumentruns_cycle_error_rates, stg_instrumentruns_cycles, stg_runids|
|raw_netsuite_location|staging|item_fulfillment_details, item_shipments, sales_orders_invoiced|
|stg_netsuite_transaction|staging|item_shipments, sales_orders_invoiced, scrap_amount|
|int_order_fufillment_details|intermediate|certified_shipments, commercial_order_fufillment_details, order_fulfillment_details|
|stg2_netsuite_transaction_lines|staging|finance_po_details, netsuite_transaction_lines, operation_bill_details, po_details, po_receipt_details, production_unit_status, purchase_orders, work_order_details, work_order_errors, work_order_planned_vs_actual_line, work_order_planned_vs_actual_main, work_order_status|
|raw_netsuite_transaction|staging|stg_netsuite_lasttransactionlink, stg_netsuite_nexttransactionlink, stg_netsuite_xx42q_serial_numbers|
|raw_values_logs_v2|staging|MVP_Instrument_Runs, Side_A_Thermal_Incubation_Accuracy_V2_New_Pipe, Side_B_Thermal_Incubation_Accuracy_V2_New_Pipe, stg1_pressure_analysis_Side_B|
 ---  
## **11. Best Practice:** Models with Too Many Joins  
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
|:---:|:---:|:---:|  
|stg2_netsuite_items|models/staging/netsuite/stg2_netsuite_items.sql|12|
|stg_salesforce_opportunity_lines|models/staging/salesforce/stg_salesforce_opportunity_lines.sql|8|
|opcenter_container_history|models/production/operations/opcenter_container_history.sql|19|
|item_shipments|models/production/operations/item_shipments.sql|9|
|int_telemetry_v2_instrument_runs|models/staging/telemetry_v2/telemetry_v2_intermediate/int_telemetry_v2_instrument_runs.sql|7|
|stg_opcenter_componentremovehistory|models/staging/opcenter/stg_opcenter_componentremovehistory.sql|8|
|stg_jira_issue_field_history|models/staging/JIRA/stg_jira_issue_field_history.sql|10|
|stg_opcenter_containermainthistory|models/staging/opcenter/stg_opcenter_containermainthistory.sql|8|
|stg_opcenter_movehistory|models/staging/opcenter/stg_opcenter_movehistory.sql|13|
|netsuite2__transaction_details|models/netsuite2/netsuite2__transaction_details.sql|14|
 ---  
## **12. Best Practice:** Multiple Sources Joined  
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
|:---:|:---:|  
|raw_opcenter_printerlabeldefinition|opcenter_odsdb.printerlabeldefinition, opcenter_odsdb.printerlabeldefinitionbase|
|raw_opcenter_erproute|opcenter_odsdb.erproute, opcenter_odsdb.erproutebase|
|raw_opcenter_spec|opcenter_odsdb.spec, opcenter_odsdb.specbase|
|raw_opcenter_workflow|opcenter_odsdb.workflow, opcenter_odsdb.workflowbase|
|raw_opcenter_billofprocess|opcenter_odsdb.billofprocess, opcenter_odsdb.billofprocessbase|
|raw_opcenter_tasklist|opcenter_odsdb.tasklist, opcenter_odsdb.tasklistbase|
|thermal_ramp_perCycle|AVITI_STATS.VALUES_LOG, telemetry_db.run|
|raw_opcenter_datacollectiondef|opcenter_odsdb.datacollectiondef, opcenter_odsdb.datacollectiondefbase|
|raw_opcenter_electronicprocedure|opcenter_odsdb.electronicprocedure, opcenter_odsdb.electronicprocedurebase|
|stg_salesforce_opportunity_lines|salesforce_tables.OPPORTUNITY, salesforce_tables.OPPORTUNITY_LINE_ITEM|
 ---  
## **13. Best Practice:** Rejoining of Upstream Concepts  
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
|:---:|:---:|:---:|:---:|  
|stg_salesforce_accounts_new|stg_salesforce_opportunity_lines_new|stg_salesforce_opportunities_new|true|
|DVT_Sample_Data|stg1_pressure_analysis_Side_A|stg1_avg_pressure_A_values_log|true|
|stg_salesforce_users|stg_salesforce_accounts|stg_salesforce_account_teams|true|
|raw_values_logs_v2|stg1_pressure_analysis_Side_B|stg1_avg_pressure_B_values_log|true|
|stg_pardot__list|pardot__lists|int__activities_by_list|true|
|int_netsuite2__accounts|int_netsuite2__tran_with_converted_amounts|int_netsuite2__acctxperiod_exchange_rate_map|true|
 ---  
## **14. Best Practice:** Root Models  
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
|:---:|  
|certified_material_movement|
|dbt_results|
|tableau_marketing_campaign_detail|
|tableau_marketing_campaign_summary|
 ---  
## **15. Best Practice:** Source Fanout  
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
|:---:|:---:|  
|salesforce_tables.PRODUCT_2|raw_salesforce_product_new, raw_salesforce_products|
|salesforce_tables.OPPORTUNITY|raw_salesforce_opportunities, raw_salesforce_opportunities_new, stg_salesforce_opportunity_lines|
|telemetry_db.run|fridge_avg_hourly_perRun, pressure_sensors_query_perhourrun, raw_telemetrydb_instrument_runs, therm_avg_hourlyper_run, thermal_ramp_perCycle|
|salesforce_tables.USER|raw_salesforce_user_new, raw_salesforce_users|
|salesforce_tables.QUOTE|raw_salesforce_quote_new, raw_salesforce_quotes|
|salesforce_tables.PRODUCT_REQUEST_LINE_ITEM|raw_salesforce_product_request_line_items, raw_salesforce_product_request_line_items_new|
|AVITI_STATS.VALUES_LOG|Fin_Thermal_Incubation_Accuracy, Fin_pressure_avg, Semi_Fin_Thermal_Ramp, fridge_avg_hourly_perRun, fridge_temps, pressure_sensors_query_perhourrun, raw_values_logs, therm_avg_hourlyper_run, thermal_ramp_perCycle|
|salesforce_tables.ACCOUNT|raw_salesforce_accounts, stg_salesforce_opportunities|
|salesforce_tables.PRODUCT_REQUEST|raw_salesforce_product_requests, raw_salesforce_product_requests_new|
|INSTRUMENT_RUNS.INGEST_RAW|s3_runs_inventory, stg_instrumentrun_events, stg_instrumentruns, stg_instrumentruns_cycle_error_rates, stg_instrumentruns_cycles, stg_instrumentruns_q30, stg_instrumentruns_v2, stg_runids, stg_telemetry_run_details|
 ---  
## **16. Best Practice:** Staging Models Dependent on Downstream Models  
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
|:---:|:---:|:---:|:---:|  
|int_telemetry_v2_instrument_runs|intermediate|stg_instrumentrun_summaries_v2|staging|
 ---  
## **17. Best Practice:** Staging Models Dependent on Other Staging Models  
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
|:---:|:---:|:---:|:---:|  
|raw_netsuite_nexttransactionlink|staging|stg_netsuite_nexttransactionlink|staging|
|raw_netsuite_nexttransactionlink|staging|stg_netsuite_transaction|staging|
|raw_netsuite_nexttransactionlink|staging|stg_netsuite_lasttransactionlink|staging|
|raw_netsuite_plandefinitionscope|staging|stg_netsuite_plandefinitionscope|staging|
|raw_netsuite_planned_orders|staging|stg_netsuite_planned_orders|staging|
|raw_netsuite_plannedstandardcost|staging|stg_standard_cost|staging|
|raw_netsuite_plannedstandardcostcomponents|staging|stg_standard_cost|staging|
|raw_netsuite_planningitem|staging|stg_netsuite_planningitem|staging|
|raw_netsuite_planningitemcategory|staging|stg_netsuite_planningitemcategory|staging|
|raw_netsuite_planningitemgroup|staging|stg_netsuite_planningitemgroup|staging|
 ---  
## **18. Best Practice:** Unused Sources  
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
|:---:|  
|arena.quality_details|
|opcenter_odsdb.defecthistoryhistorydetails|
|opcenter_odsdb.producttype|
|opcenter_odsdb.scrapreason|
|arena.quality_custom_attributes|
|arena.training_summary|
|opcenter_odsdb.resourcedef|
|arena.training_history|
|opcenter_odsdb.componentdefecthistorydetail|
|jira_tables.STATUS_CATEGORY|
 ---  
## **19. Best Practice:** Chained View Dependencies  
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
|:---:|:---:|:---:|:---:|  
|raw_salesforce_account_health|order_fulfillment_details|7|["raw_salesforce_account_health","stg_salesforce_account_health","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","order_fulfillment_details"]|
|raw_netsuite_item|order_fulfillment_details|7|["raw_netsuite_item","stg_netsuite_aggregateitemlocations","stg2_netsuite_items","stg2_netsuite_transaction_lines","stg2_netsuite_sales_order_details","int_sales_order_details","int_order_fufillment_details","order_fulfillment_details"]|
|raw_salesforce_users|certified_cases|8|["raw_salesforce_users","stg_salesforce_users","stg_salesforce_account_teams","stg_salesforce_accounts","stg_salesforce_assets","stg_salesforce_time_entry","stg_salesforce_instrument_failures","stg_salesforce_cases_lvl2","certified_cases"]|
|raw_salesforce_users|order_fulfillment_details|8|["raw_salesforce_users","stg_salesforce_users","stg_salesforce_account_teams","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","order_fulfillment_details"]|
|stg_salesforce_users|tableau_instrument_service_metrics|8|["stg_salesforce_users","stg_salesforce_account_teams","stg_salesforce_accounts","stg_salesforce_assets","stg_salesforce_time_entry","stg_salesforce_instrument_failures","stg_salesforce_cases_lvl2","stg_instrument_service_metrics","tableau_instrument_service_metrics"]|
|raw_netsuite_inventoryitemlocations|commercial_order_fufillment_details|7|["raw_netsuite_inventoryitemlocations","stg_netsuite_aggregateitemlocations","stg2_netsuite_items","stg2_netsuite_transaction_lines","stg2_netsuite_sales_order_details","int_sales_order_details","int_order_fufillment_details","commercial_order_fufillment_details"]|
|raw_salesforce_pricebook|certified_shipments|7|["raw_salesforce_pricebook","stg_salesforce_pricebook","stg_salesforce_accounts","stg_salesforce_opportunity_lines","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","certified_shipments"]|
|raw_salesforce_account_health|certified_shipments|7|["raw_salesforce_account_health","stg_salesforce_account_health","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","certified_shipments"]|
|raw_salesforce_account_teams|commercial_order_fufillment_details|7|["raw_salesforce_account_teams","stg_salesforce_account_teams","stg_salesforce_accounts","stg_salesforce_product_requests","stg2_salesforce_opp_and_req_lines","int_sales_order_details","int_order_fufillment_details","commercial_order_fufillment_details"]|
|raw_salesforce_account_teams|stg_instrument_failures|7|["raw_salesforce_account_teams","stg_salesforce_account_teams","stg_salesforce_accounts","stg_salesforce_assets","stg_salesforce_time_entry","stg_salesforce_instrument_failures","stg_salesforce_cases_lvl2","stg_instrument_failures"]|
 ---  
## **20. Best Practice:** Exposure Parents Materializations  
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
|:---:|:---:|:---:|:---:|  
|model|commercial_end_customers|OTIF_metric|view|
|model|service_end_customers|Executive_Dashboard_serviceMetric|view|
|model|service_end_customers|Customer_Fleet_Metrics|view|
|model|service_end_customers|Service_metric|view|
|model|tableau_instrumentrun_summaries|AWS_Cost_By_Service|view|
|model|tableau_instruments|AWS_Instrument_Data_Storage_Costs|view|
|model|tableau_a360_cases|A360_Dashboard|view|
|model|tableau_instruments|Executive_Dashboard_TableauMetric|view|
|model|tableau_a360_accounts|A360_Dashboard|view|
|model|tableau_instrument_run_inventory|AWS_Cost_By_Service|view|
 ---  
## **21. Best Practice:** Model Directories  
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
|:---:|:---:|:---:|:---:|:---:|  
|stg2_netsuite_sales_orders|model|staging|models/staging/netsuite/stg2_netsuite_sales_orders.sql|models/staging/netsuite_tables_v2/stg2_netsuite_sales_orders.sql|
|stg_netsuite_systemnote|model|staging|models/staging/netsuite/stg_netsuite_systemnote.sql|models/staging/netsuite_tables_v2/stg_netsuite_systemnote.sql|
|raw_netsuite_subsidiary|model|staging|models/staging/netsuite/raw/raw_netsuite_subsidiary.sql|models/staging/netsuite_tables_v2/raw_netsuite_subsidiary.sql|
|raw_salesforce_product_new|model|staging|models/staging/salesforce/raw/raw_salesforce_product_new.sql|models/staging/salesforce_tables/raw_salesforce_product_new.sql|
|Side_A_Thermal_Incubation_Accuracy_V1_Summary|model|staging|models/staging/instrumentlogs/Thermal_Incubation_Accuracy_Side_A/Side_A_Thermal_Incubation_Accuracy_V1_Summary.sql|models/staging/raw/Side_A_Thermal_Incubation_Accuracy_V1_Summary.sql|
|raw_opcenter_isinventorydetails|model|staging|models/staging/opcenter/raw_opcenter_isinventorydetails.sql|models/staging/opcenter_odsdb/raw_opcenter_isinventorydetails.sql|
|Step_Settle_per_Tile|model|staging|models/staging/instrumentlogs/run_log_tile_level_metrics/Step_Settle_per_Tile.sql|models/staging/AVITI_STATS/Step_Settle_per_Tile.sql|
|Fin_pressure_avg|model|staging|models/staging/instrumentlogs/Julia/Fin_pressure_avg.sql|models/staging/AVITI_STATS/Fin_pressure_avg.sql|
|stg_linkedin_pages__ugc_post_history|model|staging|models/stg_linkedin_pages__ugc_post_history.sql|models/staging/linkedin_pages/stg_linkedin_pages__ugc_post_history.sql|
|raw_netsuite_customrecord_xx42q_large_wostatus|model|staging|models/staging/netsuite/raw/raw_netsuite_customrecord_xx42q_large_wostatus.sql|models/staging/netsuite_tables_v2/raw_netsuite_customrecord_xx42q_large_wostatus.sql|
 ---  
## **22. Best Practice:** Model Naming Conventions  
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
|:---:|:---:|:---:|:---:|  
|raw_opcenter_esigmeaning|raw_|staging|stg_|
|raw_opcenter_esigrequirement|raw_|staging|stg_|
|raw_opcenter_historycrossref|raw_|staging|stg_|
|raw_opcenter_historymainline|raw_|staging|stg_|
|raw_opcenter_esighistorydetail|raw_|staging|stg_|
|raw_opcenter_esighistorysummary|raw_|staging|stg_|
|raw_opcenter_eventdata|raw_|staging|stg_|
|raw_opcenter_executetaskhistory|raw_|staging|stg_|
|raw_opcenter_factory|raw_|staging|stg_|
|raw_opcenter_holdreason|raw_|staging|stg_|
 ---  
## **23. Best Practice:** Source Directories  
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
|:---:|:---:|:---:|:---:|  
|arena.quality_summary|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|arena.training_history|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|arena.training_items|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|arena.training_records|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|arena.training_summary|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|arena.training_users|source|models/staging/sources.yml|models/staging/arena/sources.yml|
|boomi_logs.BOOMI_LOGS|source|models/admin/admin.yml|models/staging/boomi_logs/admin.yml|
|date_dimension.date_dimension|source|models/staging/sources.yml|models/staging/date_dimension/sources.yml|
|dates.DATE_DIMENSION|source|models/staging/sources.yml|models/staging/dates/sources.yml|
|googleanalytics.EVENT|source|models/staging/sources.yml|models/staging/googleanalytics/sources.yml|
 ---  
## **24. Best Practice:** Test Directories  
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
|:---:|:---:|:---:|:---:|  
|unique_stg_netsuite2__jobs_job_id|stg_netsuite2__jobs|models/|models/netsuite2/|
|dbt_utils_unique_combination_of_columns_netsuite2__balance_sheet_transaction_line_id__transaction_id__accounting_period_id__account_name|netsuite2__balance_sheet|models/|models/netsuite2/|
|unique_stg_netsuite2__transactions_transaction_id|stg_netsuite2__transactions|models/|models/netsuite2/|
|unique_stg_netsuite2__consolidated_exchange_rates_consolidated_exchange_rate_id|stg_netsuite2__consolidated_exchange_rates|models/|models/netsuite2/|
|not_null_stg_netsuite2__transaction_accounting_lines_transaction_id|stg_netsuite2__transaction_accounting_lines|models/|models/netsuite2/|
|unique_stg_netsuite2__currencies_currency_id|stg_netsuite2__currencies|models/|models/netsuite2/|
|not_null_stg_netsuite2__departments_department_id|stg_netsuite2__departments|models/|models/netsuite2/|
|not_null_stg_netsuite2__transaction_accounting_lines_transaction_line_id|stg_netsuite2__transaction_accounting_lines|models/|models/netsuite2/|
|not_null_stg_netsuite2__accounting_periods_accounting_period_id|stg_netsuite2__accounting_periods|models/|models/netsuite2/|
|dbt_utils_unique_combination_of_columns_netsuite2__income_statement_transaction_line_id__transaction_id__accounting_period_id__account_name|netsuite2__income_statement|models/|models/netsuite2/|
 ---  
## **25. Best Practice:** Missing Primary Key Tests  
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
|:---:|:---:|:---:|:---:|:---:|:---:|  
|raw_opcenter_esighistorydetail|model|staging|false|0|0|
|raw_opcenter_esigmeaning|model|staging|false|0|0|
|raw_opcenter_factory|model|staging|false|0|0|
|raw_opcenter_esighistorysummary|model|staging|false|0|0|
|raw_opcenter_esigrequirement|model|staging|false|0|0|
|raw_opcenter_eventdata|model|staging|false|0|0|
|raw_opcenter_executetaskhistory|model|staging|false|0|0|
|raw_opcenter_historycrossref|model|staging|false|0|0|
|raw_opcenter_historymainline|model|staging|false|0|0|
|raw_opcenter_holdreason|model|staging|false|0|0|
 ---  
## **26. Best Practice:** Test Coverage  
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
|2024-11-22 21:15:37.013 Z|820|179|80|9.76| |8.81|2.50| |14.21|0.2183|
