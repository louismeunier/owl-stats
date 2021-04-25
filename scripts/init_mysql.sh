# allow file in

mysql -u root --password="" < scripts/sql/init_db.sql

# input the data

for f in $(find ~/owl_data/2018 -name "*.csv"); do 
	export file = $f
	mysql -u root --password="" \
	-e "set @file='${file}', @table='owl2018'; source ~/scripts/sql/old_players_data.sql"
done

for f in $(find ~/owl_data/2019 -name "*.csv"); do 
	export file = $f
	mysql -u root --password="" \
	-e "set @file='${file}', @table='owl2019'; source ~/scripts/sql/old_players_data.sql"
done

echo "Moving 2020_1 to db" ; 
mysql -u root --password="" \
	-e "set @file='~/owl_data/2020/phs_2020_1.csv', @table='owl2020'; source ~/scripts/sql/2020_1.sql"

echo "Moving 2020_2 to db" ; 
mysql -u root --password="" \
	-e "set @file='~/owl_data/2020/phs_2020_2.csv', @table='owl2020'; source ~/scripts/sql/new_players_data.sql"

for f in $(find ~/owl_data/2021 -name "*.csv"); do 
	export file = $f
	mysql -u root --password="" \
	-e "set @file='${file}', @table='owl2021''; source ~/scripts/sql/new_players_data.sql"
done

echo "Done moving files"