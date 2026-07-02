{{
    config(
        materialized='incremental',
        incremental_strategy= 'merge',
        tmp_relation_type= 'transient',
        unique_key='order_id',
        on_schema_change='sync_all_columns',
        transient=False
    )
}}

with source as (

    select * from {{ ref('order_fulfillment') }}

    {% if is_incremental() %}
        where ordered_at >= (
            select coalesce(max(ordered_at), '1900-01-01'::date)
            from {{ this }}
        )
    {% endif %}

)

select * from source
