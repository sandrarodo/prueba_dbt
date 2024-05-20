{{ config(
    materialized='table'
) }}

    select 
        p_partkey as part_key,
        p_name as part_name,
        p_mfgr as manufacturer,
        p_brand as brand,
        p_type as type,
        p_size as size,
        p_container as container,
        p_retailprice as retail_price,
        p_comment as part_comment
    from {{ source('tpch_sf1', 'part') }}


