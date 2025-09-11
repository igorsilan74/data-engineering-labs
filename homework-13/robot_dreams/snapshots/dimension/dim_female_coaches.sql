{% snapshot dim_female_coaches %}

{{
config(
    target_schema='DBT_SCHEMA_SNAPSHOT',
    unique_key='coach_id',
    strategy='check',
    check_cols=['coach_url', 'long_name'],
    tags=['fifa', 'snapshot', 'dimension', 'dim_female_coaches']
)
}}

with
stg_female_coaches as (
select *
from {{ ref('stg_female_coaches') }}
)

select *
from stg_female_coaches as c

{% endsnapshot %}

