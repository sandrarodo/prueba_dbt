select count(*) as null_values
from {{ ref('fact_sales') }}
where total_quantity is not null