{{ config(
    materialized='table',
    schema = 'MART',
    tags=['fifa', 'mart', 'mart_team_dashboard_male']
) }}

with int_team_profiles_male as (
    select * from {{ ref('int_team_profiles_male') }}
),
int_male_players as (
    select * from {{ ref('int_players_male') }}
)

select tp.team_name, tp.team_rate, tp.team_cost,
LISTAGG(distinct case when p.potential>=85 then p.short_name else '' end, ', ')  as key_players
from int_team_profiles_male as tp
inner join int_male_players p on tp.team_id = p.club_team_id
group by tp.team_name, tp.team_rate, tp.team_cost

