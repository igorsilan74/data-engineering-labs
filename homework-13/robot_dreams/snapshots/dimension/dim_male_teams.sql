{% snapshot dim_male_teams %}

{{
config(
    target_schema='DBT_SCHEMA_SNAPSHOT',
    unique_key='team_id',
    strategy='check',
    check_cols=['team_url', 'team_name'],
    tags=['fifa', 'snapshot', 'dimension', 'dim_male_teams']
)
}}

with
stg_male_teams as (
select *
from {{ ref('stg_male_teams') }}
)

select *
from stg_male_teams as t

{% endsnapshot %}

