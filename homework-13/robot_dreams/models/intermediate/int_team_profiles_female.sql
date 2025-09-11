{{ config(
    materialized='table',
    schema = 'INTERMEDIATE',
    tags=['fifa', 'intermediate', 'int_team_profiles_female']
) }}

with stg_female_players as (
    select * from {{ ref('stg_female_players') }}
),
stg_female_teams as (
    select * from {{ ref('stg_female_teams') }}
)

select t.team_id, t.team_name, t.league_name
,round(avg(p.overall),2) as team_rate
,coalesce(sum(p.VALUE_EUR),0) as team_cost

from stg_female_players as p
left join stg_female_teams as t on p.club_team_id = t.team_id
group by t.team_id, t.team_name, t.league_name

