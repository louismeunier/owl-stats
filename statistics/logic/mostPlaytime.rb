#!/usr/bin/ruby

require "/home/travis/build/louismeunier/owl-stats/statistics/meta/meta"

cmd="SET @rownum:=0; 
    SELECT @rownum:=@rownum+1 place, ROUND(sum,2) as seconds, player FROM (
    SELECT SUM(stat_amount) as sum, player_name as player
    FROM OWL.owl%s WHERE stat_name='Time Played' AND hero_name='All Heroes'
    GROUP BY player_name) as sum_ranks
    ORDER BY sum DESC LIMIT 10;"

fileName="Most Playtime"

description="Players with the most play time per year (all heroes)"

query(cmd, fileName, description);