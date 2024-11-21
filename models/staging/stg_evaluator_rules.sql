with

source as (

    select
        *,
        coalesce(column_name_list is not null, false) as valid_flag
    from {{ source('evaluator', 'evaluator_rules') }}

)

select * from source
