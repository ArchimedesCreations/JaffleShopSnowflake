with

source as (

    select
        *,
        coalesce(column_name_list is not null, false) as valid_flag,
        '--depends_on:' || '{' || '{ref(''' || model_name || ''')}' || '}' as depends_on
    from {{ source('evaluator', 'evaluator_rules_pipe') }}

)

select * from source
