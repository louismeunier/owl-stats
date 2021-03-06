USE OWL;
LOAD DATA INFILE "/var/lib/mysql-files/current.csv"
INTO TABLE owl2020
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@start_time,esports_match_id,tournament_title,map_type,map_name,player_name,team_name,stat_name,hero_name,stat_amount)
SET start_time = STR_TO_DATE(@start_time, '%m/%d/%Y %H:%i');