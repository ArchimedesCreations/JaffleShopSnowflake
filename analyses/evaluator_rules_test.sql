{% set results = dbt_utils.get_query_results_as_dict('select name, column_name_list from ' ~ ref('stg_evaluator_rules') ~
' where valid_flag = true' ) %}

{{ results | length }}

