{{ config(
    materialized='table'
) }}

    select 
        ps_partkey as part_key,
        ps_suppkey as supplier_key,
        ps_availqty as available_qty,
        ps_supplycost as supply_cost,
    from {{ source('tpch_sf1', 'partsupp') }}