{{ config(
    materialized='table',
    schema = 'MART',
    tags=['fifa', 'mart', 'mart_team_dashboard_female']
) }}

with int_team_profiles_female as (
    select * from {{ ref('int_team_profiles_female') }}
),
int_female_players as (
    select * from {{ ref('int_players_female') }}
)

select tp.team_name, tp.team_rate, tp.team_cost,
LISTAGG(distinct case when p.potential>=88 then p.short_name else '' end, ', ')  as key_players
from int_team_profiles_female as tp
inner join int_female_players p on tp.team_id = p.club_team_id
group by tp.team_name, tp.team_rate, tp.team_cost

