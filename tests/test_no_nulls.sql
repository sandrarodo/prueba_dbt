-- comprueba que la cantidad total de pedidos no haya ninguno null

with sales_summary as (
    select
        total_quantity
    from {{ ref('fact_sales') }}
)

select total_quantity 
from sales_summary
where total_quantity is null
