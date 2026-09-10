select
  order_item_id,
  order_id,
  product_id,
  quantity,
  unit_price
from {{ source('retail', 'order_items') }}

