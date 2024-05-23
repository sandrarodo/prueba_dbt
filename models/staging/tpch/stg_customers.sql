{{ config(
    materialized='table'
) }}


with 

source as (
    select * from {{ source('tpch_sf1', 'customer') }}
),

customer as (
    select 
        c_custkey as customer_key,
        c_name as customer_name,
        c_address as customer_address,
        c_nationkey as nation_key,
        c_phone as customer_phone,
        c_acctbal as customer_acc_bal,
        c_mktsegment as customer_mkt_segment,
    from source
)

select * from customer