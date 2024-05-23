--dimension que muestra los clientes por localizacion

with geography as (
    select * from {{ ref("intermediate_geography")}}
),

customer as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select 
        c.nation_key,
        region_key,
        nation_name,
        region_name,
        c.customer_key,
        c.customer_name,
        c.customer_address
    from customer c
    join geography g on g.nation_key=c.nation_key
)

select * from  final