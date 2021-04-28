#!/bin/bash

# Get a stat that is based on top x for simple sums of stat_amount

# params
FILE_NAME=$1 # the name of the file to write to
STAT=$2 # the stat_name to query
UNITS=$3 # the units of stat_amount, used as column name
ORDER=$4 # desc or asc(default)

# Create file+add title
echo "# "$STAT >> /home/travis/build/louismeunier/owl-stats/out/"$FILE_NAME".md

# Iterate over all years (newest written first)
years=( 2021 2020 2019 2018 )
for y in "${years[@]}"
do
  mysql -u root --password="" OWL -t -e \
    "SET @rownum:=0; SELECT @rownum:=@rownum+1 pos, ROUND(sum,2) as '${UNITS}', player FROM (
  SELECT SUM(stat_amount) as sum, player_name as player
  FROM owl${y} WHERE stat_name='${STAT}' 
  GROUP BY player_name) as sum_ranks
  ORDER BY sum '${ORDER}' LIMIT 10;" >> temp.md
  ./statistics/md.sh temp.md
  sed -i'' '1s/^/\n'${y}'\n\n /' temp.md
  cat temp.md >> /home/travis/build/louismeunier/owl-stats/out/"$FILE_NAME".md
  rm temp.md
done