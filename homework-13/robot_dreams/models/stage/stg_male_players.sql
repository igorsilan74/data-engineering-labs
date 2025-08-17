{{ config(
    materialized='incremental',
    unique_key=['player_id', 'club_team_id', 'fifa_version', 'fifa_update'], 
    schema = 'STAGE',
    tags=['fifa', 'stage', 'stg_male_players']
) }}

with source as (
    select * from {{ source('fifa', 'male_players') }}
),

renamed as (
    select *
    from source
    where player_id is not null
)

select * from renamed

