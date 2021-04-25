mysql -u root --password="" OWL -t -e \
  "SELECT sum, player FROM (
  SELECT SUM(stat_amount) as sum, player_name as player
  FROM owl2021 WHERE stat_name='Melee Kills' 
  GROUP BY player_name) as sum_ranks
  ORDER BY sum desc;" > '~/out/mostmeleekills.md'

./statistics/convertMD.sh '~/out/mostmeleekills.md'
