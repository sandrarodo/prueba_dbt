-- tabla de hechos para calcular el rendimiento de los envios

with order_lineitem as (
    select * from {{ ref('intermediate_shipping') }}
)

select
    order_key,
    count(line_number) as total_line_items,
    sum(extended_price) as total_shipping_cost,
    sum(quantity) as total_quantity_shipped,
    avg(shipping_days) as avg_shipping_time,
    sum(delayed_shipping) as total_delayed_shipments,
    {{ validate_shipping_cost('total_shipping_cost') }} as validation_result
from order_lineitem
group by order_key