select player_id
from {{ ref('int_players_male') }}
group by player_id, club_team_id, fifa_version, fifa_update
having count(player_id) > 1
