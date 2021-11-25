{% snapshot orders_ci_test %}
-- depends_on: {{ ref('orders_stg') }}
{{
    config(
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

{% if execute %}
  select {{ mu_insert_batch_id() }} * from {{ source('public', 'orders') }}
{% endif %}
{% endsnapshot %}