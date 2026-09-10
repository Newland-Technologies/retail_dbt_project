select
  store_id,
  store_name,
  city,
  country,
  region
from {{ ref('stg_stores') }}
