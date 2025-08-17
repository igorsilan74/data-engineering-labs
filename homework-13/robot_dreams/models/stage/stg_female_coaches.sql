{{ config(
    materialized='table',
    schema = 'STAGE',
    tags=['fifa', 'stage', 'stg_female_coaches']
) }}

with source as (
    select * from {{ source('fifa', 'female_coaches') }}
),

renamed as (
    select *
    from source
    where coach_id is not null
)

select * from renamed

