USE OWL;
LOAD DATA INFILE "~/owl_data/current.csv"
INTO TABLE owl2018
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@start_time,@match_id,@stage,map_type,map_name,@player,@team,stat_name,@hero,stat_amount)
SET start_time = STR_TO_DATE(@start_time, '%m/%d/%Y %H:%i'),
esports_match_id=@match_id,
tournament_title=@stage,
player_name=@player,
team_name=@team,
hero_name=@hero;