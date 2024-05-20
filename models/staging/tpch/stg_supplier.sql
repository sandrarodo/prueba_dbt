{{ config(
    materialized='table'
) }}

    select 
        s_suppkey as supplier_key,
        s_name as supplier_name,
        s_address as supplier_address,
        s_nationkey as nation_key,
        s_phone as supplier_phone,
        s_acctbal as supplier_acc_bal,
        s_comment as supplier_comment
    from {{ source('tpch_sf1', 'supplier') }}
