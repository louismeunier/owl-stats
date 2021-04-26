#!/bin/bash
#can/should probably generalize this to make it easier for general stats; very limited rn
stat=$1
file_name=$2

years=( 2021 2020 2019 2018 )
for y in "${years[@]}"
do
  mysql -u root --password="password" OWL -t -e \
    "SET @rownum:=0; SELECT @rownum:=@rownum+1 pos,  ROUND(sum,2) as seconds, player FROM (
  SELECT SUM(stat_amount) as sum, player_name as player
  FROM owl${y} WHERE stat_name='${stat}' 
  GROUP BY player_name LIMIT 10) as sum_ranks
  ORDER BY sum desc;" >> temp.md
  ./md.sh temp.md
  sed -i '' '1s/^/\n'${y}'\n /' temp.md
  cat temp.md >>  /home/travis/build/louismeunier/owl-stats/out/$file_name.md
  rm temp.md
done