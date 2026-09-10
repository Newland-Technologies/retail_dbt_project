select
  store_id,
  store_name,
  city,
  country,
  region
from {{ source('retail', 'stores') }}

