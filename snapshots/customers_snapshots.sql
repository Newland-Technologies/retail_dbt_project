{% snapshot customers_snapshot %}
{{ config(
    target_schema='retail_dev',
    unique_key='customer_id',
    strategy='timestamp',
    updated_at='signup_date'
) }}

select *
from {{ source('retail', 'customers') }}

{% endsnapshot %}
