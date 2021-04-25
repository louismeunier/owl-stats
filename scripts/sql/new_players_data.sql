LOAD DATA INFILE @file
INTO TABLE @table
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@start_time,esports_match_id,tournament_title,map_type,map_name,player_name,team_name,stat_name,hero_name,stat_amount)
SET start_time = STR_TO_DATE(@start_time, '%Y-%m-%d %H:%i:%s');