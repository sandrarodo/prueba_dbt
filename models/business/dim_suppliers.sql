-- models/business/dim_suppliers.sql

with part_partsupp as (
    select * from {{ ref('intermediate_partsupp_supplier') }}
),

dim_suppliers as (
    select 
        supplier_key,
        array_agg(distinct part_key) as supplied_parts,
        avg(supply_cost) as avg_supply_cost
    from part_partsupp
    group by supplier_key
)

select * from dim_suppliers
