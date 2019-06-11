{{ config (
  materialized = 'table'
) }}

with listings as (
  *
  from {{ ref('stg_listings') }}
)


select * from listings 