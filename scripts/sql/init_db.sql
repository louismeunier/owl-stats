/* Create DB */
CREATE DATABASE IF NOT EXISTS `OWL`;
USE `OWL`;

SHOW VARIABLES LIKE "secure_file_priv";

/* Create all tables */
CREATE TABLE owl2021 (
  start_time DATETIME,
  esports_match_id NUMERIC,
  tournament_title VARCHAR(100),
  map_type VARCHAR(30),
  map_name VARCHAR(25),
  player_name VARCHAR(20),
  team_name VARCHAR(30),
  stat_name VARCHAR(60),
  hero_name VARCHAR(20),
  stat_amount DECIMAL(50,20)
);

CREATE TABLE owl2020 LIKE owl2021;
CREATE TABLE owl2019 LIKE owl2021;
CREATE TABLE owl2018 LIKE owl2021;