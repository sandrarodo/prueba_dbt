with sales as (
    select * from {{ ref('intermediate_sales') }}
)

select
    order_key,
    customer_key,
    sum(quantity) as total_quantity,
    sum(net_price) as total_sales,
from sales
group by order_key, customer_key