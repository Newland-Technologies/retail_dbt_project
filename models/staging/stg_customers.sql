select
  customer_id,
  first_name,
  last_name,
  lower(email) as email,
  country,
  signup_date
from {{ source('retail', 'customers') }}

