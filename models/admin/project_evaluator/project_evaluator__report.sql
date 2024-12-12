--depends_on:{{ref('fct_documentation_coverage')}}
--depends_on:{{ref('fct_undocumented_models')}}
--depends_on:{{ref('fct_undocumented_source_tables')}}
--depends_on:{{ref('fct_undocumented_sources')}}
--depends_on:{{ref('fct_exposures_dependent_on_private_models')}}
--depends_on:{{ref('fct_public_models_without_contract')}}
--depends_on:{{ref('fct_undocumented_public_models')}}
--depends_on:{{ref('fct_direct_join_to_source')}}
--depends_on:{{ref('fct_marts_or_intermediate_dependent_on_source')}}
--depends_on:{{ref('fct_duplicate_sources')}}
--depends_on:{{ref('fct_hard_coded_references')}}
--depends_on:{{ref('fct_model_fanout')}}
--depends_on:{{ref('fct_too_many_joins')}}
--depends_on:{{ref('fct_multiple_sources_joined')}}
--depends_on:{{ref('fct_rejoining_of_upstream_concepts')}}
--depends_on:{{ref('fct_root_models')}}
--depends_on:{{ref('fct_source_fanout')}}
--depends_on:{{ref('fct_staging_dependent_on_marts_or_intermediate')}}
--depends_on:{{ref('fct_staging_dependent_on_staging')}}
--depends_on:{{ref('fct_unused_sources')}}
--depends_on:{{ref('fct_chained_views_dependencies')}}
--depends_on:{{ref('fct_exposure_parents_materializations')}}
--depends_on:{{ref('fct_model_directories')}}
--depends_on:{{ref('fct_model_naming_conventions')}}
--depends_on:{{ref('fct_source_directories')}}
--depends_on:{{ref('fct_test_directories')}}
--depends_on:{{ref('fct_missing_primary_key_tests')}}
--depends_on:{{ref('fct_test_coverage')}}


-- This model dynamically generates markdown documentation for best practice evaluations.
-- It evaluates multiple models to identify inconsistencies and outputs findings in a structured markdown format.

-- The view `stg_project_evaluator_metadata` points to the seed table which contains the information about the project evaluator best practices.
-- It is important to note that get_query_results_as_dict returns an array by column
{% set results = dbt_utils.get_query_results_as_dict('select TYPE, NAME, URL, MODEL_NAME, COLUMN_NAME_LIST, DATA_TYPE_LIST, FINDINGS, RISK, BEST_PRACTICES 
from ' ~ ref("stg_project_evaluator_metadata") ~ ' where enabled_flag = true order by TYPE, NAME' ) -%}

-- Limit for the how many results to show in the sample results table for each best practice section
{%- set show_x_results = 10 -%}

-- There are multiple CTE section bulds to loop through the results of each best practice analysis
-- The first set of CTEs built are the results for each best practice and they are named based on the MODEL_NAME with a suffix of _results.
-- || CHAR(13) || CHAR(10) || is used to consistently put in line breaks in the returning md text.
-- number_of_inconsistencies is determined for each best practice by counting the rows in each project evaluator results models
-- There is logic to determin
WITH 
{%for i in range(results['NAME'] | length) -%} 
{{results['MODEL_NAME'][i]}}_results AS (
    SELECT '## **' || lpad({{i}}, 2, '0' ) || '. Best Practice:** {{ results['NAME'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '**Finding:**  {{ results['FINDINGS'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '**Risk:** {{results['RISK'][i] | replace("'", "''") }}  '|| CHAR(13) || CHAR(10) ||
        '**Best Practice:**  {{ results['BEST_PRACTICES'][i] | replace("'", "''")}}  '|| CHAR(13) || CHAR(10) ||
        '[More Details]({{ results['URL'][i]}})  '|| CHAR(13) || CHAR(10) ||
        
        {%- set number_of_inconsistencies = dbt_utils.get_single_value('SELECT COUNT(*) FROM ' ~ ref(results['MODEL_NAME'][i] )) %}

        {% if number_of_inconsistencies == 0 -%}

            '#### This best practice is being followed.  '|| CHAR(13) || CHAR(10) AS summary,
            '{{ results['TYPE'][i] | replace("'", "''")}}' AS type,
            '{{ results['NAME'][i] | replace("'", "''")}}' as name,
            {{ number_of_inconsistencies }} AS number_of_inconsistencies,
            lpad({{i}}, 2, '0' ) || 'A' AS sort_order
    
        {%- else -%}

            {%- if number_of_inconsistencies < show_x_results -%}
                '#### Showing  {{ number_of_inconsistencies }} of {{ number_of_inconsistencies }}  '|| CHAR(13) || CHAR(10) ||
            {%- else -%}
                '#### Showing  {{ show_x_results }} of {{ number_of_inconsistencies }}  '|| CHAR(13) || CHAR(10) ||
            {%- endif %}
            'SQL queries to get full results: dbt then database notation  ' || CHAR(13) || CHAR(10) ||
            '~~~  ' || CHAR(13) || CHAR(10) ||
            'SELECT * FROM {' || '{ ref( {{ results['MODEL_NAME'][i] }} )}'|| '}  ' || CHAR(13) || CHAR(10) ||
            'SELECT * FROM {{ ref(results['MODEL_NAME'][i])}}  ' || CHAR(13) || CHAR(10) ||
            '~~~  ' || CHAR(13) || CHAR(10) ||

            '| ' || 
            {%- for column in results['COLUMN_NAME_LIST'][i].split(', ') -%}
                ' **{{ column }}** |' ||
            {%- endfor %} 
            '  '|| CHAR(13) || CHAR(10) ||
            '|' ||
            {%- for data_type in results['DATA_TYPE_LIST'][i].split(', ') -%}
                {%- if data_type in ['TEXT', 'ARRAY'] -%}
                    ':---|' ||
                {%- else -%}
                    ':---:|' ||
                {%- endif -%}
            {%- endfor %}         
             '  ' || CHAR(13) || CHAR(10) as summary,
            '{{ results['TYPE'][i] | replace("'", "''")}}' AS type,
            '{{ results['NAME'][i] | replace("'", "''")}}' as name,
            {{ number_of_inconsistencies }} AS number_of_inconsistencies, 
            lpad({{i}}, 2, '0' ) || 'A'AS sort_order
        {%- endif -%}
    ),
    --this CTE contains the logic on how to present the sample results
    {{results['MODEL_NAME'][i]}}_results_table AS (
        SELECT 
         {%- if number_of_inconsistencies == 0 -%}
            --return nothing
            ''as summary, 
            NULL AS type,
            NULL as name,
            NULL AS number_of_inconsistencies, 
            lpad({{i}}, 2, '0' ) || 'B'AS sort_order

        {%- else -%}

                '|'
                {%- for column in results['COLUMN_NAME_LIST'][i].split(', ') -%} 
                    || NVL(CAST({{ column }} AS VARCHAR), ' ') || '|'
                {%- endfor %} 
                || CHAR(13) || CHAR(10) as summary, 
            NULL AS type,
            NULL as name,
            NULL AS number_of_inconsistencies, 
            lpad({{i}}, 2, '0' ) || 'B'AS sort_order
            FROM {{ ref(results['MODEL_NAME'][i])}}
            LIMIT {{ show_x_results }} 

        {%- endif %}
), 
{%  endfor %}
--this CTE builds the summary table using the information from the model CTEs
summary_results AS 
(   
    SELECT 
    '## **Summary of Evaluator Best Practices**  ' || CHAR(13) || CHAR(10) ||
    '| **Sort** | **Type** | **Name** | **Number of Opportunities** |  ' || CHAR(13) || CHAR(10) ||
    '|:---:|:---:|:---:|:---:|  ' || CHAR(13) || CHAR(10) as summary,
    lpad('!', 4, '0' ) AS sort_order

    UNION ALL

    {%-for j in range(results['NAME'] | length) %}

        SELECT '|' || lpad({{j}}, 2, '0' ) || '|' || type || '|' || name || '|' || number_of_inconsistencies  || '|  ' || CHAR(13) || CHAR(10) as summary,
            lpad({{j}}, 4, '0' ) AS sort_order
        FROM {{results['MODEL_NAME'][j]}}_results
            {% if not loop.last -%}
                UNION ALL
            {% endif %}

    {%- endfor -%}
    
    UNION ALL

    SELECT CHAR(13) || CHAR(10) || '*Note: Many Git providers will show a table of contents of this markdown document.*  ' || CHAR(13) || CHAR(10) as summary,
        lpad('99', 4, '0' ) AS sort_order
),
--This CTE smashes the results and results table CTEs together
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
--this final listagg puts all the results into one cell
SELECT LISTAGG(summary, '') WITHIN GROUP (ORDER BY sort_order) AS complete_summary
FROM evaluator_results