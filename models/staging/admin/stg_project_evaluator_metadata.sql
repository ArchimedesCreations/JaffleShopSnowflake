with

source as (

    select
        *
    from {{ source('project_evaluator', 'project_evaluator_metadata') }}

)

select * from source
