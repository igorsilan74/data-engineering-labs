{{ config(
    materialized='table',
    schema = 'MART',
    tags=['fifa', 'mart', 'mart_player_profiles_male']
) }}

with int_male_players as (
    select * from {{ ref('int_players_male') }}
)

select p.player_id, p.long_name, 
case when max(age) < 21 then 'U21' when max(age) between 21 and 28 then 'Prime' else 'Veteran' end as age_group,
LISTAGG(distinct p.player_tags, ', ')  as classification
from int_male_players as p
group by p.player_id, p.long_name

