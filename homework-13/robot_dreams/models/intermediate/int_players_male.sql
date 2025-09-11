{{ config(
    materialized='incremental',
    unique_key=['player_id', 'club_team_id', 'fifa_version', 'fifa_update'],
    schema = 'INTERMEDIATE',
    tags=['fifa', 'intermediate', 'int_players_male']
) }}

with stg_male_players as (
    select * from {{ ref('stg_male_players') }}
)

select p.*, 'male' as gender 
from stg_male_players as p

