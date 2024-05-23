with sales_summary as (
    select
        total_quantity,
    from {{ ref('fact_sales') }}
)

select total_quantity 
from sales_summary
where total_quantity  < 0
