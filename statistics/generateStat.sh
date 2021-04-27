#!/bin/bash
#can/should probably generalize this to make it easier for general stats; very limited rn
file_name=$1
stat=$2

years=( 2021 2020 2019 2018 )
for y in "${years[@]}"
do
  mysql -u root --password="" OWL -t -e \
    "SELECT ROUND(sum,2) as seconds, player FROM (
  SELECT SUM(stat_amount) as sum, player_name as player
  FROM owl${y} WHERE stat_name='${stat}' 
  GROUP BY player_name LIMIT 10) as sum_ranks
  ORDER BY sum desc;" >> /home/travis/build/louismeunier/owl-stats/statistics/temp.md
  ./statistics/md.sh /home/travis/build/louismeunier/owl-stats/statistics/temp.md
  sed -i'' '1s/^/\n'${y}'\n /' /home/travis/build/louismeunier/owl-stats/statistics/temp.md
  cat /home/travis/build/louismeunier/owl-stats/statistics/temp.md >> /home/travis/build/louismeunier/owl-stats/out/"$file_name".md
  rm /home/travis/build/louismeunier/owl-stats/statistics/temp.md
done