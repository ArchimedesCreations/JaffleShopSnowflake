{{ config(materialized='table') }}

with 

    staging_dependent_on_staging as (

        select 
            'Modeling' as test_type,
            'fct_staging_dependent_on_staging' as table_name,
            'staging_dependent_on_staging' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/staging_models_dependent_on_other_staging_models' as url,
            count(*) as test_count
        from {{ ref('fct_staging_dependent_on_staging') }}

    ),

    source_fanout as (

        select 
            'Modeling' as test_type,
            'fct_source_fanout' as table_name,
            'source_fanout' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/source_fanout/' as url,
            count(*) as test_count
        from {{ ref('fct_source_fanout') }}

    ),

    rejoining_of_upstream_concepts as (

        select 
            'Modeling' as test_type,
            'fct_rejoining_of_upstream_concepts' as table_name,
            'rejoining_of_upstream_concepts' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/rejoining_of_upstream_concepts/' as url,
            count(*) as test_count
        from {{ ref('fct_rejoining_of_upstream_concepts') }}

    ),

    model_fanout as (

        select
            'Modeling' as test_type,
            'fct_model_fanout' as table_name,
            'model_fanout' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/model_fanout/' as url,
            count(*) as test_count
        from {{ ref('fct_model_fanout') }}

    ),

    marts_or_intermediate_dependent_on_source as (

        select 
            'Modeling' as test_type,
            'fct_marts_or_intermediate_dependent_on_source' as table_name,
            'marts_or_intermediate_dependent_on_source' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/marts_or_intermediate_dependent_on_source/' as url,
            count(*) as test_count
        from {{ ref('fct_marts_or_intermediate_dependent_on_source') }}

    ),

    direct_join_to_source as (

        select 
            'Modeling' as test_type,
            'fct_direct_join_to_source' as table_name,
            'direct_join_to_source' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/direct_join_to_source/' as url,
            count(*) as test_count
        from {{ ref('fct_direct_join_to_source') }}

    ),

    duplicate_sources as (

        select
            'Modeling' as test_type,
            'fct_duplicate_sources' as table_name,
            'duplicate_sources' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/duplicate_sources/' as url,
            count(*) as test_count
        from {{ ref('fct_duplicate_sources') }}

    ),

    hard_coded_references as (

        select 
            'Modeling' as test_type,
            'fct_hard_coded_references' as table_name,
            'hard_coded_references' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/hard_coded_references/' as url,
            count(*) as test_count
        from {{ ref('fct_hard_coded_references') }}

    ),

    multiple_sources_joined as (

        select 
            'Modeling' as test_type,
            'fct_multiple_sources_joined' as table_name,
            'multiple_sources_joined' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/multiple_sources_joined/' as url,
            count(*) as test_count
        from {{ ref('fct_multiple_sources_joined') }}

    ),

    root_models as (

        select
            'Modeling' as test_type,
            'fct_root_models' as table_name,
            'root_models' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/root_models/' as url,
            count(*) as test_count
        from {{ ref('fct_root_models') }}

    ),

    staging_dependent_on_marts_or_intermediate as (

        select 
            'Modeling' as test_type,
            'fct_staging_dependent_on_marts_or_intermediate' as table_name,
            'staging_dependent_on_marts_or_intermediate' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/staging_models_dependent_on_downstream_models/' as url,
            count(*) as test_count
        from {{ ref('fct_staging_dependent_on_marts_or_intermediate') }}

    ),

    unused_sources as (

        select 
            'Modeling' as test_type,
            'fct_unused_sources' as table_name,
            'unused_sources' as test_name, 
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/unused_sources/' as url,
            count(*) as test_count
        from {{ ref('fct_unused_sources') }}

    ),

    too_many_joins as (

        select 
            'Modeling' as test_type,
            'fct_too_many_joins' as table_name,
            'models_with_too_many_joins' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/models_with_too_many_joins/' as url,
            count(*) as test_count
        from {{ ref('fct_too_many_joins') }}

    ),

    missing_primary_key_tests as (

        select 
            'Testing' as test_type,
            'fct_missing_primary_key_tests' as table_name,
            'missing_primary_key_tests' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/missing_primary_key_tests/' as url,
            count(*) as test_count
        from {{ ref('fct_missing_primary_key_tests') }}

    ),

    test_coverage as (

        select 
            'Testing' as test_type,
            'fct_test_coverage' as table_name,
            'test_coverage' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/test_coverage/' as url,
            count(*) as test_count
        from {{ ref('fct_test_coverage') }}

    ),

    undocumented_models as (

        select 
            'Documentation' as test_type,
            'fct_undocumented_models' as table_name,
            'undocumented_models' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/undocumented_models/' as url,
            count(*) as test_count
        from {{ ref('fct_undocumented_models') }}

    ),

    documentation_coverage as (

        select
            'Documentation' as test_type,
            'fct_documentation_coverage' as table_name,
            'documentation_coverage' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/documentation_coverage/' as url,
            count(*)
        from {{ ref('fct_documentation_coverage') }}

    ),

    undocumented_source_tables as (

        select
            'Documentation' as test_type, 
            'fct_undocumented_source_tables' as table_name,
            'undocumented_source_tables' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/undocumented_source_tables/' as url,
            count(*) as test_count
        from {{ ref('fct_undocumented_source_tables') }}

    ),

    undocumented_sources as (

        select 
            'Documentation' as test_type,
            'fct_undocumented_sources' as table_name,
            'undocumented_sources' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/undocumented_sources/' as url,
            count(*) as test_count
        from {{ ref('fct_undocumented_sources') }}

    ),

    test_directories as (

        select 
            'Structure' as test_type,
            'fct_test_directories' as table_name,
            'test_directories' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/test_directories/' as url,
            count(*) as test_count
        from {{ ref('fct_test_directories') }}

    ),

    model_naming_conventions as (

        select
            'Structure' as test_type,
            'fct_model_naming_conventions' as table_name,
            'model_naming_conventions' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/model_naming_conventions/' as url,
            count(*) as test_count
        from {{ ref('fct_model_naming_conventions') }}

    ),

    source_directories as (

        select 
            'Structure' as test_type,
            'fct_source_directories' as table_name,
            'source_directories' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/source_directories/' as url,
            count(*) as test_count
        from {{ ref('fct_source_directories') }}

    ),

    model_directories as (

        select
            'Structure' as test_type, 
            'fct_model_directories' as table_name,
            'model_directories' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/model_directories/' as url,
            count(*) as test_count
        from {{ ref('fct_model_directories') }}

    ),

    chained_views_dependencies as (

        select 
            'Performance' as test_type,
            'fct_chained_views_dependencies' as table_name,
            'chained_views_dependencies' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/chained_views_dependencies/' as url,
            count(*) as test_count
        from {{ ref('fct_chained_views_dependencies') }}

    ),

    exposure_parents_materializations as (

        select
            'Performance' as test_type,
            'fct_exposure_parents_materializations' as table_name,
            'exposure_parents_materializations' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/exposure_parents_materializations/' as url,
            count(*) as test_count
        from {{ ref('fct_exposure_parents_materializations') }}

    ),


    exposures_dependent_on_private_models as (

        select 
            'Governance' as test_type,
            'fct_exposures_dependent_on_private_models' as table_name,
            'exposures_dependent_on_private_models' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/exposures_dependent_on_private_models/' as url,
            count(*) as test_count
        from {{ ref('fct_exposures_dependent_on_private_models') }}

    ),

    undocumented_public_models as (

        select 
            'Governance' as test_type,
            'fct_undocumented_public_models' as table_name,
            'undocumented_public_models' as test_name,
            'https://dbt-labs.github.io/dbt-project-evaluator/latest/rules/undocumented_public_models/' as url,
            count(*) as test_count
        from {{ ref('fct_undocumented_public_models') }}

    ),

    -- Combine all CTEs with UNION ALL
    combined_results as (
        select * from staging_dependent_on_staging
        union all select * from source_fanout
        union all select * from rejoining_of_upstream_concepts
        union all select * from model_fanout
        union all select * from marts_or_intermediate_dependent_on_source
        union all select * from direct_join_to_source
        union all select * from duplicate_sources
        union all select * from hard_coded_references
        union all select * from multiple_sources_joined
        union all select * from root_models
        union all select * from staging_dependent_on_marts_or_intermediate
        union all select * from unused_sources
        union all select * from too_many_joins
        union all select * from missing_primary_key_tests
        union all select * from test_coverage
        union all select * from undocumented_models
        union all select * from documentation_coverage
        union all select * from undocumented_source_tables
        union all select * from undocumented_sources
        union all select * from test_directories
        union all select * from model_naming_conventions
        union all select * from source_directories
        union all select * from model_directories
        union all select * from chained_views_dependencies
        union all select * from exposure_parents_materializations
        union all select * from exposures_dependent_on_private_models
        union all select * from undocumented_public_models
    )

select 
    * 
from combined_results