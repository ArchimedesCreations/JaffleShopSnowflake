with

orders as (

    select * from {{ ref('stg_orders') }}

),

fulfillment as (

    select
        order_id,
        ordered_at,
        dateadd(
            day,
            (abs(hash(order_id)) % 5) + 1,
            ordered_at
        ) as delivered_at

    from orders

),

final as (

    select
        order_id,
        ordered_at,
        delivered_at,
        datediff(day, ordered_at, delivered_at) as days_to_fulfill,
        iff(datediff(day, ordered_at, delivered_at) > 3, 1, 0) as is_late

    from fulfillment

)

select * from final
