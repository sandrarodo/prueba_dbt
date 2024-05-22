with partsupp as (
    select * from {{ ref('stg_partsupp') }}
),

supplier as (
    select * from {{ ref('stg_supplier') }}
),

partsupp_supplier as (
    select
        ps.part_key,
        ps.supplier_key,
        ps.available_qty,
        ps.supply_cost,
        s.supplier_name,
        s.supplier_address,
        s.nation_key,
        s.supplier_phone,
        s.supplier_acc_bal
    from partsupp ps
    join supplier s on ps.supplier_key = s.supplier_key
)

select * from partsupp_supplier