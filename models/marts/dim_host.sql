{{ config (
  materialized = 'table'
) }}

with host as (
  select 
  host_name,
  host_since,
  response_rate,
  response_time,
  count(listings_id)
      over (partition by host_name order by listings_id
        rows between unbounded preceding and unbounded following) as total_listings
  from {{ ref('stg_listings') }}
)


select * from host

