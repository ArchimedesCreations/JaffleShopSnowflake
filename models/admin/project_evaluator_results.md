## **RULE:** Chained View Dependencies  
**Problem:**  Models depend on long chains of views or ephemeral models.  
**Why It's Bad:** Can lead to long runtimes due to nested queries.  
**Solution:**  Change the materialization of some upstream models to table or incremental. Prioritize views used by many models or those with complex calculations.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/performance/#chained-view-dependencies)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Direct Join to Source  
**Problem:**  Models join directly to sources when a staging model exists.  
**Why It's Bad:** Inconsistent transformation logic; duplicated code.  
**Solution:**  Create a staging model and have other models reference it.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#direct-join-to-source)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Documentation Coverage  
**Problem:**  Not all models have descriptions.  
**Why It's Bad:** Makes it harder for others to understand the models.  
**Solution:**  Add descriptions to models using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#documentation-coverage)  
#### Showing  1 of 1  
|  **MEASURED_AT** | **TOTAL_MODELS** | **DOCUMENTED_MODELS** | **DOCUMENTATION_COVERAGE_PCT** | **BASE_DOCUMENTATION_COVERAGE_PCT** | **STAGING_DOCUMENTATION_COVERAGE_PCT** | **INTERMEDIATE_DOCUMENTATION_COVERAGE_PCT** | **MARTS_DOCUMENTATION_COVERAGE_PCT** | **OTHER_DOCUMENTATION_COVERAGE_PCT** |  
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|  
|2024-11-21 03:28:09.808 Z|14|8|57.14| |100.00| |28.57|0.00|
 ---  
## **RULE:** Downstream Models Dependent on Source  
**Problem:**  Marts/intermediate models depend directly on sources.  
**Why It's Bad:** Violates the principle of staging models as the atomic unit of data modeling.  
**Solution:**  Add a staging model between the source and downstream model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#downstream-models-dependent-on-source)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Duplicate Sources  
**Problem:**  Multiple source nodes defined for the same database object.  
**Why It's Bad:** Inaccurate lineage.  
**Solution:**  Combine duplicate source nodes into one.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#duplicate-sources)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Exposure Parents Materializations  
**Problem:**  Exposures reference sources or models that are not materialized as tables.  
**Why It's Bad:** Exposures should reference transformed data, and their parents should be performant for downstream use.  
**Solution:**  If referencing a source, incorporate the data into a model. Change the materialization of model parents to table or incremental.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/performance/#exposure-parents-materializations)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Exposures Dependent on Private Models  
**Problem:**  Exposures reference private models.  
**Why It's Bad:** Exposures should reference trusted, public, and contracted data sources.  
**Solution:**  Change the access configuration of the referenced models to public. Consider adding contracts and full documentation to these models as well.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#exposures-dependent-on-private-models)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Hard Coded References  
**Problem:**  Using hard-coded table/view names instead of ref() and source().  
**Why It's Bad:** dbt can't infer dependencies or generate the DAG correctly.  
**Solution:**  Replace with ref() for models and source() for raw data.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#hard-coded-references)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Missing Primary Key Tests  
**Problem:**  Models lack tests on their primary keys.  
**Why It's Bad:** Risks data reliability and scalability.  
**Solution:**  Apply not_null, unique, or unique_combination_of_columns tests to primary keys.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/testing/#missing-primary-key-tests)  
#### Showing  5 of 5  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **MODEL_TYPE** | **IS_PRIMARY_KEY_TESTED** | **NUMBER_OF_TESTS_ON_MODEL** | **NUMBER_OF_CONSTRAINTS_ON_MODEL** |  
|:---:|:---:|:---:|:---:|:---:|:---:|  
|products|model|marts|false|0|0|
|supplies|model|marts|false|0|0|
|Untitled|model|other|false|0|0|
|locations|model|marts|false|0|0|
|metricflow_time_spine|model|marts|false|0|0|
 ---  
## **RULE:** Model Directories  
**Problem:**  Models are not in the correct subdirectory.  
**Why It's Bad:** Poor organization makes it hard to find models.  
**Solution:**  Move staging models to a subfolder matching their source. Nest other models closest to the folder matching their type.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#model-directories)  
#### Showing  6 of 6  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **MODEL_TYPE** | **CURRENT_FILE_PATH** | **CHANGE_FILE_PATH_TO** |  
|:---:|:---:|:---:|:---:|:---:|  
|stg_locations|model|staging|models/staging/stg_locations.sql|models/staging/ecom/stg_locations.sql|
|stg_orders|model|staging|models/staging/stg_orders.sql|models/staging/ecom/stg_orders.sql|
|stg_supplies|model|staging|models/staging/stg_supplies.sql|models/staging/ecom/stg_supplies.sql|
|stg_order_items|model|staging|models/staging/stg_order_items.sql|models/staging/ecom/stg_order_items.sql|
|stg_customers|model|staging|models/staging/stg_customers.sql|models/staging/ecom/stg_customers.sql|
|stg_products|model|staging|models/staging/stg_products.sql|models/staging/ecom/stg_products.sql|
 ---  
## **RULE:** Model Fanout  
**Problem:**  A single model has too many direct children.  
**Why It's Bad:** Transformations might be better in the BI layer or consolidated.  
**Solution:**  Move transformations to the BI layer or create intermediate models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#model-fanout)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Model Naming Conventions  
**Problem:**  Models don't have the correct prefix (e.g., stg_, int_, fct_, dim_).  
**Why It's Bad:** Confusing for users; model type isn't clear.  
**Solution:**  Add the appropriate prefix to model names.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#model-naming-conventions)  
#### Showing  7 of 7  
|  **RESOURCE_NAME** | **PREFIX** | **MODEL_TYPE** | **APPROPRIATE_PREFIXES** |  
|:---:|:---:|:---:|:---:|  
|products|products_|marts|dim_, fct_|
|supplies|supplies_|marts|dim_, fct_|
|Untitled|Untitled_|other|rpt_|
|customers|customers_|marts|dim_, fct_|
|locations|locations_|marts|dim_, fct_|
|order_items|order_|marts|dim_, fct_|
|orders|orders_|marts|dim_, fct_|
 ---  
## **RULE:** Models with Too Many Joins  
**Problem:**  Models have excessive joins.  
**Why It's Bad:** Increased complexity; harder to understand and maintain.  
**Solution:**  Break down complex models into smaller ones.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#models-with-too-many-joins)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Multiple Sources Joined  
**Problem:**  A single staging model joins data from multiple sources.  
**Why It's Bad:** Violates the one-to-one relationship between staging models and sources.  
**Solution:**  Create separate staging models for each source, then join them in an intermediate model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#multiple-sources-joined)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Rejoining of Upstream Concepts  
**Problem:**  A model joins data already joined upstream, creating a "loop" in the DAG.  
**Why It's Bad:** Unnecessary complexity and potential performance issues.  
**Solution:**  Consolidate logic into a single model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#rejoining-of-upstream-concepts)  
#### Showing  1 of 1  
|  **PARENT** | **CHILD** | **PARENT_AND_CHILD** | **IS_LOOP_INDEPENDENT** |  
|:---:|:---:|:---:|:---:|  
|stg_orders|orders|order_items|true|
 ---  
## **RULE:** Root Models  
**Problem:**  Models have no defined parents.  
**Why It's Bad:** dbt can't interpret lineage, potentially leading to errors.  
**Solution:**  Ensure all models use ref() and source() to define dependencies.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#root-models)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Source Directories  
**Problem:**  Source definitions are not in the correct subdirectory.  
**Why It's Bad:** Makes it harder to find and manage source definitions.  
**Solution:**  Move source definitions to a YAML file in the subdirectory matching the source.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#source-directories)  
#### Showing  6 of 6  
|  **RESOURCE_NAME** | **RESOURCE_TYPE** | **CURRENT_FILE_PATH** | **CHANGE_FILE_PATH_TO** |  
|:---:|:---:|:---:|:---:|  
|ecom.raw_customers|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_items|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_orders|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_products|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_stores|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
|ecom.raw_supplies|source|models/staging/__sources.yml|models/staging/ecom/__sources.yml|
 ---  
## **RULE:** Source Fanout  
**Problem:**  A single source has multiple direct child models.  
**Why It's Bad:** Duplicates transformation logic; harder to update if the source changes.  
**Solution:**  Create a single staging model for each source and have other models reference it.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#source-fanout)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Staging Models Dependent on Downstream Models  
**Problem:**  Staging models depend on intermediate or marts models.  
**Why It's Bad:** Violates the principle that staging models should only select from sources.  
**Solution:**  Rename or reconfigure the model to depend on sources.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#staging-models-dependent-on-downstream-models)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Staging Models Dependent on Other Staging Models  
**Problem:**  Staging models depend on other staging models.  
**Why It's Bad:** Indicates potential misnaming or incorrect dependencies.  
**Solution:**  Rename or reconfigure the model to depend on sources or intermediate models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#staging-models-dependent-on-other-staging-models)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Test Coverage  
**Problem:**  Not all models have tests.  
**Why It's Bad:** Decreases confidence in data accuracy.  
**Solution:**  Apply generic or singular tests to models. Aim for 100% coverage with at least not_null and unique tests on primary keys.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/testing/#test-coverage)  
#### Showing  1 of 1  
|  **MEASURED_AT** | **TOTAL_MODELS** | **TOTAL_TESTS** | **TESTED_MODELS** | **TEST_COVERAGE_PCT** | **BASE_TEST_COVERAGE_PCT** | **STAGING_TEST_COVERAGE_PCT** | **INTERMEDIATE_TEST_COVERAGE_PCT** | **MARTS_TEST_COVERAGE_PCT** | **OTHER_TEST_COVERAGE_PCT** | **TEST_TO_MODEL_RATIO** |  
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|  
|2024-11-21 03:28:09.808 Z|14|27|9|64.29| |100.00| |42.86|0.00|1.9286|
 ---  
## **RULE:** Test Directories  
**Problem:**  Model tests are not in the same directory as the model.  
**Why It's Bad:** Disorganized tests make it harder to find and maintain them.  
**Solution:**  Move tests to a YAML file in the same directory as the model.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/structure/#test-directories)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Undocumented Models  
**Problem:**  Models lack descriptions.  
**Why It's Bad:** Hinders understanding and discoverability of models.  
**Solution:**  Add descriptions to models using YAML or docs blocks. Prioritize marts models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-models)  
#### Showing  6 of 6  
|  **RESOURCE_NAME** | **MODEL_TYPE** |  
|:---:|:---:|  
|supplies|marts|
|metricflow_time_spine|marts|
|products|marts|
|Untitled|other|
|locations|marts|
|order_items|marts|
 ---  
## **RULE:** Undocumented Public Models  
**Problem:**  Public models lack complete documentation (model and column descriptions).  
**Why It's Bad:** Reduces usability for downstream consumers.  
**Solution:**  Add a model description and descriptions for each column in public models.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/governance/#undocumented-public-models)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Undocumented Source Tables  
**Problem:**  Source tables lack descriptions.  
**Why It's Bad:** Makes it harder to understand the source data.  
**Solution:**  Add descriptions to source tables using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-source-tables)  
#### Showing  1 of 1  
|  **RESOURCE_NAME** |  
|:---:|  
|ecom.raw_stores|
 ---  
## **RULE:** Undocumented Sources  
**Problem:**  Sources lack descriptions.  
**Why It's Bad:** Makes it harder to understand how data is loaded into the warehouse.  
**Solution:**  Add descriptions to sources using YAML or docs blocks.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation/#undocumented-sources)  
#### There were NO detected violations of this rule  
 ---  
## **RULE:** Unused Sources  
**Problem:**  Sources are defined in YAML but not used.  
**Why It's Bad:** Unnecessary clutter.  
**Solution:**  Remove unused sources from the YAML file.  
[More Details](https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/modeling/#unused-sources)  
#### There were NO detected violations of this rule  
