select
  oi.order_item_id,
  oi.order_id,
  oi.product_id,
  oi.quantity,
  oi.unit_price,
  oi.quantity * oi.unit_price as sales_amount,
  oi.quantity * (oi.unit_price - p.cost) as profit
from {{ ref('stg_order_items') }} oi
join {{ ref('stg_products') }} p
  on oi.product_id = p.product_id
