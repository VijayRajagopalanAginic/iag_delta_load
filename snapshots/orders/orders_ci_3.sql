{% snapshot orders_ci_3 %}
-- depends_on: {{ ref('orders_stg') }}
{{
    config(
      target_schema='snapshots',
      unique_key='id',
      pre_hook=before_begin("{{ delta_load_job_control_start('" ~ this.identifier ~ "') }}"),

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

{% if execute %}

  {% if macro_run_snapshot_yn(this.identifier) %}
    select {{ mu_insert_batch_id() }} * from {{ ref('orders_stg') }}
  {% endif %}

{% endif %}

{% endsnapshot %}