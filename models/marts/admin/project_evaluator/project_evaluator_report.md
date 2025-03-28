## **Summary of Evaluator Best Practices **  
| **Sort** | **Type** | **Name** | **Number of Opportunities** |  
|:---:|:---:|:---:|:---:|  
|00|Documentation|Documentation Coverage|1|  
|01|Documentation|Undocumented Models|6|  
|02|Documentation|Undocumented Source Tables|1|  
|03|Documentation|Undocumented Sources|0|  
|04|Governance|Exposures Dependent on Private Models|0|  
|05|Governance|Public models without contracts|0|  
|06|Governance|Undocumented Public Models|0|  
|07|Modeling|Direct Join to Source|0|  
|08|Modeling|Downstream Models Dependent on Source|0|  
|09|Modeling|Duplicate Sources|0|  
|10|Modeling|Hard Coded References|0|  
|11|Modeling|Model Fanout|0|  
|12|Modeling|Models with Too Many Joins|0|  
|13|Modeling|Multiple Sources Joined|0|  
|14|Modeling|Rejoining of Upstream Concepts|1|  
|15|Modeling|Root Models|0|  
|16|Modeling|Source Fanout|0|  
|17|Modeling|Staging Models Dependent on Downstream Models|0|  
|18|Modeling|Staging Models Dependent on Other Staging Models|0|  
|19|Modeling|Unused Sources|0|  
|20|Performance|Chained View Dependencies|0|  
|21|Performance|Exposure Parents Materializations|0|  
|22|Structure|Model Directories|7|  
|23|Structure|Model Naming Conventions|8|  
|24|Structure|Source Directories|7|  
|25|Structure|Test Directories|0|  
|26|Testing|Missing Primary Key Tests|7|  
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
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_documentation_coverage  
~~~  
|  **MEASURED_AT** | **TOTAL_MODELS** | **DOCUMENTED_MODELS** | **DOCUMENTATION_COVERAGE_PCT** | **BASE_DOCUMENTATION_COVERAGE_PCT** | **STAGING_DOCUMENTATION_COVERAGE_PCT** | **INTERMEDIATE_DOCUMENTATION_COVERAGE_PCT** | **MARTS_DOCUMENTATION_COVERAGE_PCT** | **OTHER_DOCUMENTATION_COVERAGE_PCT** |  
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|  
|2024-12-12 15:54:22.636 Z|16|10|62.50| |85.71| |28.57|100.00|
 ---  
## **01. Best Practice:** Undocumented Models  
**Finding:**  Models lack descriptions.  
**Risk:** Hinders understanding and discoverability of models.  
**Best Practice:**  Add descriptions to models using YAML or docs blocks. Prioritize marts models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-models)  
#### Showing  6 of 6  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_undocumented_models )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_undocumented_models  
~~~  
|  **RESOURCE_NAME** | **MODEL_TYPE** |  
|:---|:---|  
|supplies|marts|
|locations|marts|
|metricflow_time_spine|marts|
|order_items|marts|
|products|marts|
|stg_project_evaluator_metadata|staging|
 ---  
## **02. Best Practice:** Undocumented Source Tables  
**Finding:**  Source tables lack descriptions.  
**Risk:** Makes it harder to understand the source data.  
**Best Practice:**  Add descriptions to source tables using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-source-tables)  
#### Showing  1 of 1  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_undocumented_source_tables )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_undocumented_source_tables  
~~~  
|  **RESOURCE_NAME** |  
|:---|  
|ecom.raw_stores|
 ---  
## **03. Best Practice:** Undocumented Sources  
**Finding:**  Sources lack descriptions.  
**Risk:** Makes it harder to understand how data is loaded into the warehouse.  
**Best Practice:**  Add descriptions to sources using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-sources)  
#### This best practice is being followed.  
 ---  
## **04. Best Practice:** Exposures Dependent on Private Models  
**Finding:**  Exposures reference private models.  
**Risk:** Exposures should reference trusted, public, and contracted data sources.  
**Best Practice:**  Change the access configuration of the referenced models to public. Consider adding contracts and full documentation to these models as well.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#exposures-dependent-on-private-models)  
#### This best practice is being followed.  
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
#### This best practice is being followed.  
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
#### This best practice is being followed.  
 ---  
## **11. Best Practice:** Model Fanout  
**Finding:**  A single model has too many direct children.  
**Risk:** Transformations might be better in the BI layer or consolidated.  
**Best Practice:**  Move transformations to the BI layer or create intermediate models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#model-fanout)  
#### This best practice is being followed.  
 ---  
## **12. Best Practice:** Models with Too Many Joins  
**Finding:**  Models have excessive joins.  
**Risk:** Increased complexity; harder to understand and maintain.  
**Best Practice:**  Break down complex models into smaller ones.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#models-with-too-many-joins)  
#### This best practice is being followed.  
 ---  
## **13. Best Practice:** Multiple Sources Joined  
**Finding:**  A single staging model joins data from multiple sources.  
**Risk:** Violates the one-to-one relationship between staging models and sources.  
**Best Practice:**  Create separate staging models for each source, then join them in an intermediate model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#multiple-sources-joined)  
#### This best practice is being followed.  
 ---  
## **14. Best Practice:** Rejoining of Upstream Concepts  
**Finding:**  A model joins data already joined upstream, creating a "loop" in the DAG.  
**Risk:** Unnecessary complexity and potential performance issues.  
**Best Practice:**  Consolidate logic into a single model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#rejoining-of-upstream-concepts)  
#### Showing  1 of 1  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_rejoining_of_upstream_concepts )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_rejoining_of_upstream_concepts  
~~~  
|  **PARENT** | **CHILD** | **PARENT_AND_CHILD** | **IS_LOOP_INDEPENDENT** |  
|:---|:---|:---|:---:|  
|stg_orders|orders|order_items|true|
 ---  
## **15. Best Practice:** Root Models  
**Finding:**  Models have no defined parents.  
**Risk:** dbt can't interpret lineage, potentially leading to errors.  
**Best Practice:**  Ensure all models use ref() and source() to define dependencies.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#root-models)  
#### This best practice is being followed.  
 ---  
## **16. Best Practice:** Source Fanout  
**Finding:**  A single source has multiple direct child models.  
**Risk:** Duplicates transformation logic; harder to update if the source changes.  
**Best Practice:**  Create a single staging model for each source and have other models reference it.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#source-fanout)  
#### This best practice is being followed.  
 ---  
## **17. Best Practice:** Staging Models Dependent on Downstream Models  
**Finding:**  Staging models depend on intermediate or marts models.  
**Risk:** Violates the principle that staging models should only select from sources.  
**Best Practice:**  Rename or reconfigure the model to depend on sources.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#staging-models-dependent-on-downstream-models)  
#### This best practice is being followed.  
 ---  
## **18. Best Practice:** Staging Models Dependent on Other Staging Models  
**Finding:**  Staging models depend on other staging models.  
**Risk:** Indicates potential misnaming or incorrect dependencies.  
**Best Practice:**  Rename or reconfigure the model to depend on sources or intermediate models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#staging-models-dependent-on-other-staging-models)  
#### This best practice is being followed.  
 ---  
## **19. Best Practice:** Unused Sources  
**Finding:**  Sources are defined in YAML but not used.  
**Risk:** Unnecessary clutter.  
**Best Practice:**  Remove unused sources from the YAML file.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#unused-sources)  
#### This best practice is being followed.  
 ---  
## **20. Best Practice:** Chained View Dependencies  
**Finding:**  Models depend on long chains of views or ephemeral models.  
**Risk:** Can lead to long runtimes due to nested queries.  
**Best Practice:**  Change the materialization of some upstream models to table or incremental. Prioritize views used by many models or those with complex calculations.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/performance/#chained-view-dependencies)  
#### This best practice is being followed.  
 ---  
## **21. Best Practice:** Exposure Parents Materializations  
**Finding:**  Exposures reference sources or models that are not materialized as tables.  
**Risk:** Exposures should reference transformed data, and their parents should be performant for downstream use.  
**Best Practice:**  If referencing a source, incorporate the data into a model. Change the materialization of model parents to table or incremental.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/performance/#exposure-parents-materializations)  
#### This best practice is being followed.  
 ---  
## **22. Best Practice:** Model Directories  
**Finding:**  Models are not in the correct subdirectory.  
**Risk:** Poor organization makes it hard to find models.  
**Best Practice:**  Move staging models to a subfolder matching their source. Nest other models closest to the folder matching their type.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#model-directories)  
#### Showing  7 of 7  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_model_directories )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_model_directories  
~~~  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **MODEL_TYPE** | **CURRENT_FILE_PATH** | **CHANGE_FILE_PATH_TO** |  
|:---|:---|:---|:---|:---|  
|stg_customers|model|staging|models/staging/stg_customers.sql|models/staging/ecom/stg_customers.sql|
|stg_products|model|staging|models/staging/stg_products.sql|models/staging/ecom/stg_products.sql|
|stg_project_evaluator_metadata|model|staging|models/staging/admin/stg_project_evaluator_metadata.sql|models/staging/project_evaluator/stg_project_evaluator_metadata.sql|
|stg_supplies|model|staging|models/staging/stg_supplies.sql|models/staging/ecom/stg_supplies.sql|
|stg_order_items|model|staging|models/staging/stg_order_items.sql|models/staging/ecom/stg_order_items.sql|
|stg_orders|model|staging|models/staging/stg_orders.sql|models/staging/ecom/stg_orders.sql|
|stg_locations|model|staging|models/staging/stg_locations.sql|models/staging/ecom/stg_locations.sql|
 ---  
## **23. Best Practice:** Model Naming Conventions  
**Finding:**  Models don't have the correct prefix (e.g., stg_, int_, fct_, dim_).  
**Risk:** Confusing for users; model type isn't clear.  
**Best Practice:**  Add the appropriate prefix to model names.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#model-naming-conventions)  
#### Showing  8 of 8  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_model_naming_conventions )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_model_naming_conventions  
~~~  
|  **RESOURCE_NAME** | **PREFIX** | **MODEL_TYPE** | **APPROPRIATE_PREFIXES** |  
|:---|:---|:---|:---|  
|order_items|order_|marts|dim_, fct_|
|supplies|supplies_|marts|dim_, fct_|
|project_evaluator__report_view|project_|other|rpt_|
|project_evaluator__report|project_|other|rpt_|
|products|products_|marts|dim_, fct_|
|orders|orders_|marts|dim_, fct_|
|locations|locations_|marts|dim_, fct_|
|customers|customers_|marts|dim_, fct_|
 ---  
## **24. Best Practice:** Source Directories  
**Finding:**  Source definitions are not in the correct subdirectory.  
**Risk:** Makes it harder to find and manage source definitions.  
**Best Practice:**  Move source definitions to a YAML file in the subdirectory matching the source.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#source-directories)  
#### Showing  7 of 7  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_source_directories )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_source_directories  
~~~  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **CURRENT_FILE_PATH** | **CHANGE_FILE_PATH_TO** |  
|:---|:---|:---|:---|  
|project_evaluator.project_evaluator_metadata|source|models/staging/admin/_admin__project_evaluator_sources.yml|models/staging/project_evaluator/_admin__project_evaluator_sources.yml|
|ecom.raw_items|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_orders|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_products|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_stores|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_supplies|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_customers|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
 ---  
## **25. Best Practice:** Test Directories  
**Finding:**  Model tests are not in the same directory as the model.  
**Risk:** Disorganized tests make it harder to find and maintain them.  
**Best Practice:**  Move tests to a YAML file in the same directory as the model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#test-directories)  
#### This best practice is being followed.  
 ---  
## **26. Best Practice:** Missing Primary Key Tests  
**Finding:**  Models lack tests on their primary keys.  
**Risk:** Risks data reliability and scalability.  
**Best Practice:**  Apply not_null, unique, or unique_combination_of_columns tests to primary keys.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/testing/#missing-primary-key-tests)  
#### Showing  7 of 7  
SQL queries to get full results: dbt then database notation  
~~~  
SELECT * FROM {{ ref( fct_missing_primary_key_tests )}}  
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_missing_primary_key_tests  
~~~  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **MODEL_TYPE** | **IS_PRIMARY_KEY_TESTED** | **NUMBER_OF_TESTS_ON_MODEL** | **NUMBER_OF_CONSTRAINTS_ON_MODEL** |  
|:---|:---|:---|:---:|:---:|:---:|  
|project_evaluator__report|model|other|false|0|0|
|project_evaluator__report_view|model|other|false|0|0|
|stg_project_evaluator_metadata|model|staging|false|0|0|
|supplies|model|marts|false|0|0|
|locations|model|marts|false|0|0|
|metricflow_time_spine|model|marts|false|0|0|
|products|model|marts|false|0|0|
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
SELECT * FROM LEWEN_DEV.dbt_lewen.fct_test_coverage  
~~~  
|  **MEASURED_AT** | **TOTAL_MODELS** | **TOTAL_TESTS** | **TESTED_MODELS** | **TEST_COVERAGE_PCT** | **BASE_TEST_COVERAGE_PCT** | **STAGING_TEST_COVERAGE_PCT** | **INTERMEDIATE_TEST_COVERAGE_PCT** | **MARTS_TEST_COVERAGE_PCT** | **OTHER_TEST_COVERAGE_PCT** | **TEST_TO_MODEL_RATIO** |  
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|  
|2024-12-12 15:54:22.636 Z|16|27|9|56.25| |85.71| |42.86|0.00|1.6875|
