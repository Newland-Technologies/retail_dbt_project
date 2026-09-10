select *
from {{ ref('fact_incremental_sales') }}
where sales_amount < 0

