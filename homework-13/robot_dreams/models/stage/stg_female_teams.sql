{{ config(
    materialized='table',
    schema = 'STAGE',
    tags=['fifa', 'stage', 'stg_female_teams']
) }}

with source as (
    select * from {{ source('fifa', 'female_teams') }}
),

renamed as (
    select *
    from source
    where team_id is not null
)

select * from renamed

