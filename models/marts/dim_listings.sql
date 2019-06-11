{{ config (
  materialized = 'table'
) }}

with listings as (
  select
    *,
    {{ has_wifi() }}
  from {{ ref('stg_listings') }}
)


select * from listings 