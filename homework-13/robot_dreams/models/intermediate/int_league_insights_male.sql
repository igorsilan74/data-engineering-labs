{{ config(
    materialized='table',
    schema = 'INTERMEDIATE',
    tags=['fifa', 'intermediate', 'int_league_insights_male']
) }}

with int_team_profiles_male as (
    select * from {{ ref('int_team_profiles_male') }}
),
int_players_male as (
    select p.club_team_id, sum(case when p.age <= 23 and p.potential > 85 then 1 else 0 end) as talent_count
    from {{ ref('int_players_male') }} as p
    where p.club_team_id is not null
    group by p.club_team_id
)

select tp.league_name, round(avg(tp.team_rate),2) as league_rate, case when sum(p.talent_count) > 0 then TRUE else FALSE end as is_young_potential
from int_team_profiles_male as tp
inner join int_players_male as p on tp.team_id = p.club_team_id
group by tp.league_name

