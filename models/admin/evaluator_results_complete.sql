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

{% set results = dbt_utils.get_query_results_as_dict('select TYPE, NAME, PROBLEM, WHY_ITS_BAD, SOLUTION, URL, MODEL_NAME, COLUMN_NAME_LIST 
from ' ~ ref("stg_evaluator_rules") ~ ' where valid_flag = true order by TYPE, NAME' ) -%}
{%- set show_x_results = 10 -%}

WITH 
{%for i in range(results['NAME'] | length) -%} 
{{results['MODEL_NAME'][i]}}_results AS (
    SELECT '## **' || lpad({{i}}, 2, '0' ) || '. Best Practice:** {{ results['NAME'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '**Finding:**  {{ results['PROBLEM'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '**Risk:** {{results['WHY_ITS_BAD'][i] | replace("'", "''") }}  '|| CHAR(13) || CHAR(10) ||
        '**Best Practice:**  {{ results['SOLUTION'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '[More Details]({{ results['URL'][i]}})  '|| CHAR(13) || CHAR(10) ||

        {%- set number_of_violations = dbt_utils.get_single_value('SELECT COUNT(*) FROM ' ~ ref(results['MODEL_NAME'][i] )) %}

        {% if number_of_violations == 0 -%}

            '#### This best practice is being followed.  '|| CHAR(13) || CHAR(10) AS summary,
            '{{ results['TYPE'][i] | replace("'", "''")}}' AS type,
            '{{ results['NAME'][i] | replace("'", "''")}}' as name,
            {{ number_of_violations }} AS number_of_violations,
            lpad({{i}}, 2, '0' ) || 'A' AS sort_order
    
        {%- else -%}

            {%- if number_of_violations < show_x_results -%}
                '#### Showing  {{ number_of_violations }} of {{ number_of_violations }}  '|| CHAR(13) || CHAR(10) ||
            {%- else -%}
                '#### Showing  {{ show_x_results }} of {{ number_of_violations }}  '|| CHAR(13) || CHAR(10) ||
            {%- endif %}
            'SQL queries to get full results: dbt then database notation  ' || CHAR(13) || CHAR(10) ||
            'SELECT * FROM {' || '{ ref( {{ results['MODEL_NAME'][i] }} )}'|| '}  ' || CHAR(13) || CHAR(10) ||
            'SELECT * FROM {{ ref(results['MODEL_NAME'][i])}}  ' || CHAR(13) || CHAR(10) ||

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
            '{{ results['TYPE'][i] | replace("'", "''")}}' AS type,
            '{{ results['NAME'][i] | replace("'", "''")}}' as name,
            {{ number_of_violations }} AS number_of_violations, 
            lpad({{i}}, 2, '0' ) || 'A'AS sort_order
        {%- endif -%}
    ),
    -- need to create another CTE to limit the data set. 
    --If you limnit the data set post UNION ALL then you run the risk of losing the header.

    {{results['MODEL_NAME'][i]}}_results_table AS (
        SELECT 
         {%- if number_of_violations == 0 -%}
            --return nothing
            ''as summary, 
            NULL AS type,
            NULL as name,
            NULL AS number_of_violations, 
            lpad({{i}}, 2, '0' ) || 'B'AS sort_order

        {%- else -%}

                '|'
                {%- for column in results['COLUMN_NAME_LIST'][i].split(', ') -%} 
                    || NVL(CAST({{ column }} AS VARCHAR), ' ') || '|'
                {%- endfor %} 
                || CHAR(13) || CHAR(10) as summary, 
            NULL AS type,
            NULL as name,
            NULL AS number_of_violations, 
            lpad({{i}}, 2, '0' ) || 'B'AS sort_order
            FROM {{ ref(results['MODEL_NAME'][i])}}
            LIMIT {{ show_x_results }} 

        {%- endif %}
), 
{%  endfor %}
summary_results AS 
(   
    SELECT 
    '## **Summary of Evaluator Rules**  ' || CHAR(13) || CHAR(10) ||
    '| **Sort** | **Type** | **Name** | **Number of Opportunities** |  ' || CHAR(13) || CHAR(10) ||
    '|:---:|:---:|:---:|:---:|  ' || CHAR(13) || CHAR(10) as summary,
    lpad('!', 4, '0' ) AS sort_order

    UNION ALL

    {%-for j in range(results['NAME'] | length) %}

        SELECT '|' || lpad({{j}}, 2, '0' ) || '|' || type || '|' || name || '|' || number_of_violations  || '|' || CHAR(13) || CHAR(10) as summary,
            lpad({{j}}, 4, '0' ) AS sort_order
        FROM {{results['MODEL_NAME'][j]}}_results
            {% if not loop.last -%}
                UNION ALL
            {% endif %}

    {%- endfor -%}
    
    UNION ALL

    SELECT '*Note: Many Git providers will show a table of contents of this markdown document.*' as summary,
        lpad('99', 4, '0' ) AS sort_order
),
evaluator_results AS 
(
    SELECT * FROM summary_results
    UNION ALL
    {%for j in range(results['NAME'] | length) -%} 

        SELECT  summary, sort_order
        FROM {{results['MODEL_NAME'][j]}}_results
        UNION ALL
        SELECT  summary, sort_order
        FROM {{results['MODEL_NAME'][j]}}_results_table

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