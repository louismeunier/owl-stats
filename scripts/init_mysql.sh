# allow file in
echo "[mysqld]\n\rsecure_file_priv=~/owl_data" > ~travis/.my.cnf

sudo systemctl restart mysql

mysql -u root --password="" < sql/init_db.sql

# input the data

for file in $(find ~/owl_data/2018 -name "*.csv"); do 
	echo "'{$file}' -> db" ; 
	mysql -u root --password="" \
	-e "set @file='{$file}', @table='owl2018'; source sql/old_players_data.sql"
done

for file in $(find ~/owl_data/2019 -name "*.csv"); do 
	echo "'{$file}' -> db" ; 
	mysql -u root --password="" \
	-e "set @file='{$file}', @table='owl2019'; source sql/old_players_data.sql"
done

echo "Moving 2020_1 to db" ; 
mysql -u root --password="" \
	-e "set @file='~/owl_data/2020/phs_2020_1.csv', @table='owl2020'; source sql/2020_1.sql"

echo "Moving 2020_2 to db" ; 
mysql -u root --password="" \
	-e "set @file='~/owl_data/2020/phs_2020_2.csv', @table='owl2020'; source sql/new_players_data.sql"

for file in $(find ~/owl_data/2021 -name "*.csv"); do 
	echo "'{$file}' -> db" ; 
	mysql -u root --password="" \
	-e "set @file='{$file}'; source sql/new_players_data.sql"
done

echo "Done moving files"