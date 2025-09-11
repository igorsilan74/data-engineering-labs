{% snapshot dim_female_teams %}

{{
config(
    target_schema='DBT_SCHEMA_SNAPSHOT',
    unique_key='team_id',
    strategy='check',
    check_cols=['team_url', 'team_name'],
    tags=['fifa', 'snapshot', 'dimension', 'dim_female_teams']
)
}}

with
stg_female_teams as (
select *
from {{ ref('stg_female_teams') }}
)

select *
from stg_female_teams as t

{% endsnapshot %}

