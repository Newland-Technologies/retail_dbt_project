select
  o.order_id,
  o.customer_id,
  o.store_id,
  o.order_date,
  o.order_status,
  sum(oi.quantity) as total_items,
  sum(oi.sales_amount) as total_revenue,
  sum(oi.profit) as total_profit
from {{ ref('stg_orders') }} o
left join {{ ref('int_order_items') }} oi
  on o.order_id = oi.order_id
group by 1,2,3,4,5
