{{ config(
    materialized='incremental',
    unique_key='order_key'
) }}

select 
    o_orderkey as order_key,
    o_custkey as customer_key,
    o_orderstatus as order_status,
    o_totalprice as order_total_price,
    o_orderdate as order_date,
    o_orderpriority as order_priority,
    o_clerk as order_clerk,
    o_shippriority as ship_priority,
    o_comment as order_comment
from {{ source('tpch_sf1', 'orders') }}


-- Para hacerlo incremental
{% if is_incremental() %}
    where order_date > (select (max(order_date)) from {{ this }})
{% endif %}
--{{ this }} para referirnos a la tabla que estamos creando/actualizando
