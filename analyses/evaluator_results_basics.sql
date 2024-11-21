--depends_on: {{ ref('fct_staging_dependent_on_staging') }}
--depends_on: {{ ref('fct_source_fanout') }}
--depends_on: {{ ref('fct_rejoining_of_upstream_concepts') }}
--depends_on: {{ ref('fct_model_fanout') }}
--depends_on: {{ ref('fct_marts_or_intermediate_dependent_on_source') }}
--depends_on: {{ ref('fct_direct_join_to_source') }}
--depends_on: {{ ref('fct_duplicate_sources') }}
--depends_on: {{ ref('fct_hard_coded_references') }}
--depends_on: {{ ref('fct_multiple_sources_joined') }}
--depends_on: {{ ref('fct_root_models') }}
--depends_on: {{ ref('fct_staging_dependent_on_marts_or_intermediate') }}
--depends_on: {{ ref('fct_unused_sources') }}
--depends_on: {{ ref('fct_too_many_joins') }}
--depends_on: {{ ref('fct_missing_primary_key_tests') }}
--depends_on: {{ ref('fct_test_coverage') }}
--depends_on: {{ ref('fct_undocumented_models') }}
--depends_on: {{ ref('fct_documentation_coverage') }}
--depends_on: {{ ref('fct_undocumented_source_tables') }}
--depends_on: {{ ref('fct_undocumented_sources') }}
--depends_on: {{ ref('fct_test_directories') }}
--depends_on: {{ ref('fct_model_naming_conventions') }}
--depends_on: {{ ref('fct_source_directories') }}
--depends_on: {{ ref('fct_model_directories') }}
--depends_on: {{ ref('fct_chained_views_dependencies') }}
--depends_on: {{ ref('fct_exposure_parents_materializations') }}
--depends_on: {{ ref('fct_exposures_dependent_on_private_models') }}
--depends_on: {{ ref('fct_undocumented_public_models') }}

{% set results = dbt_utils.get_query_results_as_dict('select NAME, PROBLEM, WHY_ITS_BAD, SOLUTION, URL, MODEL_NAME, COLUMN_NAME_LIST 
from ' ~ ref("stg_evaluator_rules") ~ ' where valid_flag = true order by 1' ) -%}
{%- set show_x_results = 10 -%}

WITH 
{%for i in range(results['NAME'] | length) -%} 
{{results['MODEL_NAME'][i]}}_results AS (
    SELECT '## **RULE:** {{ results['NAME'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '**Problem:**  {{ results['PROBLEM'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '**Why It''s Bad:** {{results['WHY_ITS_BAD'][i] | replace("'", "''") }}  '|| CHAR(13) || CHAR(10) ||
        '**Solution:**  {{ results['SOLUTION'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '[More Details]({{ results['URL'][i]}})  '|| CHAR(13) || CHAR(10) ||

        {%- set number_of_violations = dbt_utils.get_single_value('SELECT COUNT(*) FROM ' ~ ref(results['MODEL_NAME'][i] )) %}

        {% if number_of_violations == 0 -%}

            '#### There were NO detected violations of this rule  '|| CHAR(13) || CHAR(10) AS summary,
            lpad({{i}}, 2, '0' ) || 'A' AS sort_order
    
        {%- else -%}

            {%- if number_of_violations < show_x_results -%}
                '#### Showing  {{ number_of_violations }} of {{ number_of_violations }}  '|| CHAR(13) || CHAR(10) ||
            {%- else -%}
                '#### Showing  {{ show_x_results }} of {{ number_of_errors }}  '|| CHAR(13) || CHAR(10) ||
            {%- endif %}

            '| ' || 
            {%- for column in results['COLUMN_NAME_LIST'][i].split(', ') -%}
                ' **{{ column }}** |' ||
            {%- endfor %} 
            '  '|| CHAR(13) || CHAR(10) ||
            '|' ||
            {%- for column in results['COLUMN_NAME_LIST'][i].split(', ') -%}
                ':---:|' ||
            {%- endfor %}         
             '  ' || CHAR(13) || CHAR(10) as summary, 
            lpad({{i}}, 2, '0' ) || 'A'AS sort_order
            
            UNION ALL

            SELECT '|'
                {%- for column in results['COLUMN_NAME_LIST'][i].split(', ') -%} 
                    || NVL(CAST({{ column }} AS VARCHAR), ' ') || '|'
                {%- endfor %} 
                || CHAR(13) || CHAR(10) as summary, 
            lpad({{i}}, 2, '0' ) || 'B'AS sort_order
            FROM {{ ref(results['MODEL_NAME'][i])}}
            LIMIT {{ show_x_results + 1 }} 

        {%- endif %}
), 
{%  endfor %}
evaluator_results AS 
(
    {%-for j in range(results['NAME'] | length) -%} 
        SELECT * FROM {{results['MODEL_NAME'][j]}}_results
        {% if not loop.last -%}
        UNION ALL
        SELECT  ' ---  '|| CHAR(13) || CHAR(10)  as summary,
        lpad({{j}}, 2, '0' ) || 'C'AS sort_order
        UNION ALL
        {% endif %}
    {%- endfor -%}
)
SELECT LISTAGG(summary, '') WITHIN GROUP (ORDER BY sort_order) AS complete_summary
FROM evaluator_results