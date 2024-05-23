with orders as (
    select * from {{ ref('stg_orders') }}
),

lineitem as (
    select * from {{ ref('stg_lineitem') }}
)

select
    l.order_key,
    l.line_number,
    o.order_date,
    l.ship_date,
    l.extended_price,
    l.quantity,
    datediff('day', o.order_date, l.ship_date) as shipping_days,
    case 
        when l.ship_date > o.order_date then 1 
        else 0 
    end as delayed_shipping
from lineitem l
join orders o on l.order_key = o.order_key