{% snapshot dim_male_coaches %}

{{
config(
    target_schema='DBT_SCHEMA_SNAPSHOT',
    unique_key='coach_id',
    strategy='check',
    check_cols=['coach_url', 'long_name'],
    tags=['fifa', 'snapshot', 'dimension', 'dim_male_coaches']
)
}}

with
stg_male_coaches as (
select *
from {{ ref('stg_male_coaches') }}
)

select *
from stg_male_coaches as c

{% endsnapshot %}

