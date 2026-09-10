select
  product_id,
  product_name,
  category,
  price,
  cost
from {{ source('retail', 'products') }}


