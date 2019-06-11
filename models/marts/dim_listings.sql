{{ config (
  materialized = 'table'
) }}

with listings as (
  *,
  {{ has_wifi }}
  from {{ ref('stg_listings') }}
)


select * from listings 