{{ config (
  materialized = 'table'
  dist = 'review_id'
  sort = 'review_id'
) }}

with review as (
  select 
    reviewer_name,
    first_value("date") 
      over (partition by reviewer_name order by "date" rows 
        between unbounded preceding and current row) as first_review_at,
    listings_id,
    count(review)
      over (partition by reviewer_name order by "date"
        rows between unbounded preceding and unbounded following) as total_reviews
  from {{ ref('stg_reviews') }}
),

listings as (
  select
    listings_id,
    neighbourhood
  from {{ ref('stg_listings') }}
),

joined as (
  select
    reviewer_name,
    first_review_at,
    listings.neighbourhood,
    total_reviews
  from review
  join listings 
    on review.listings_id = listings.listings_id
)

select * from joined

