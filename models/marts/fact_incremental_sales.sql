{{ config(
    materialized='incremental',
    unique_key='order_item_id',
    partition_by={"field": "order_date", "data_type": "date"},
    cluster_by=["customer_id", "product_id", "store_id"]
) }}

select
  oi.order_item_id,
  oi.order_id,
  o.customer_id,
  oi.product_id,
  o.store_id,
  o.order_date,
  oi.quantity,
  oi.sales_amount,
  oi.profit
from {{ ref('int_order_items') }} oi
join {{ ref('stg_orders') }} o
  on oi.order_id = o.order_id

{% if is_incremental() %}
where oi.order_item_id > (select max(order_item_id) from {{ this }})
{% endif %}

