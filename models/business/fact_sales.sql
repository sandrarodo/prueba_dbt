-- tabla de hechos donde se calcula el numero de pedidos del cliente, la suma de las cantidades de los pedidos
-- el total de ventas para cada cliente y la media de las ventas por pedido (macro)

with sales as (
    select * from {{ ref('intermediate_sales') }}
)

select
    order_key,
    customer_key,
    count(order_key) as order_count,
    sum(quantity) as total_quantity,
    sum(net_price) as total_sales,
    {{calculate_average('total_sales','order_count')}} as average_sales_per_order

from sales
group by order_key, customer_key