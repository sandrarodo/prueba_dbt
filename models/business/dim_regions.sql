with region as (
    select * from {{ ref('stg_region') }}
),

nation as (
    select * from {{ ref('stg_nation') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

customer as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select 
        r.region_key as region_key,
        r.region_name as region_name,
        n.nation_name as nation_name,
        count(c.customer_key) as customer_count,
        c.customer_key,
        c.customer_name,
        c.customer_address,
       
    from customer c
    join nation n on c.customer_nation_key = n.nation_key
    join region r on n.region_key = r.region_key
    group by r.region_key, r.region_name, n.nation_key, n.nation_name
)

select * from  final