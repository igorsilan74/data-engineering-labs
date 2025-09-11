{{ config(
    materialized='table',
    schema = 'STAGE',
    tags=['fifa', 'stage', 'stg_male_teams']
) }}

with source as (
    select * from {{ source('fifa', 'male_teams') }}
),

renamed as (
    select *
    from source
    where team_id is not null
)

select * from renamed

