with lineitem as (
    select * from {{ ref('stg_lineitem') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

part as (
    select * from {{ ref('stg_part') }}
),

intermediate as (
    select
        li.order_key,
        o.customer_key,
        part_name,
        quantity,
        extended_price,
        discount,
        tax,
        ship_date,
        (extended_price * (1 - discount) * (1 + tax)) as net_price
    from lineitem li
    join orders o on li.order_key = o.order_key
    join part p on li.part_key = p.part_key
)

select * from intermediate
