#!/usr/bin/ruby

require "/home/travis/build/louismeunier/owl-stats/statistics/meta/meta"

cmd="SET @rownum:=0; 
    SELECT @rownum:=@rownum+1 place, ROUND(sum,2) as seconds, player FROM (
    SELECT SUM(stat_amount) as sum, player_name as player
    FROM owl%s WHERE stat_name='Time Hacked' 
    GROUP BY player_name) as sum_ranks
    ORDER BY sum DESC LIMIT 10;"

fileName="Time Hacked"

query(cmd, fileName);