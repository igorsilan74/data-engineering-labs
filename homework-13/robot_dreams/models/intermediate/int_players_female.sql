{{ config(
    materialized='incremental',
    unique_key=['player_id', 'club_team_id', 'fifa_version', 'fifa_update'],
    schema = 'INTERMEDIATE',
    tags=['fifa', 'intermediate', 'int_players_female']
) }}

with stg_female_players as (
    select * from {{ ref('stg_female_players') }}
)

select p.*, 'female' as gender 
from stg_female_players as p

