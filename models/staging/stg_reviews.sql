with source as (
  select * from source_data.reviews
),

renamed as (
  select
    review,
    listing_id,
    id,
    comments,
    reviewer_name,
    "date"


  from source
)

select * from renamed