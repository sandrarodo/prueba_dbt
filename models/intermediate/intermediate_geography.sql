with region as (
    select * from {{ ref('stg_region') }}
),

nation as (
    select * from {{ ref('stg_nation') }}
),

geography as (
    select
        nation_key,
        n.region_key,
        nation_name,
        region_name,
    from nation n
    join region r on n.region_key = r.region_key
)

select * from geography
