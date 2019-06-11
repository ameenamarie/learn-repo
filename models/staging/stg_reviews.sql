with source as (
  select * from source_data.reviews
),

renamed as (
  review,
  listing_id,
  id as review_id,
  comments,
  reviewer_name,
  "date"


  from source
)

select * from renamed