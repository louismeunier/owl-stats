# allow file in

mysql -u root --password="" < scripts/sql/init_db.sql

# input the data

for f in $(find ~/owl_data/2018 -name "*.csv"); do 
	cp $f ~/owl_data/current.csv
	mysql -u root --password="" \
	-e "source scripts/sql/2018.sql;"
done

for f in $(find ~/owl_data/2019 -name "*.csv"); do 
	cp $f ~/owl_data/current.csv
	mysql -u root --password="" \
	-e "source scripts/sql/2019.sql;"
done

echo "Moving 2020_1 to db" ; 
cp ~/owl_data/2020/phs_2020_1.csv ~/owl_data/current.csv
mysql -u root --password="" \
	-e "source scripts/sql/2020_1.sql;"

echo "Moving 2020_2 to db" ; 
cp ~/owl_data/2020/phs_2020_2.csv ~/owl_data/current.csv
mysql -u root --password="" \
	-e "source scripts/sql/2020_2.sql;"

for f in $(find ~/owl_data/2021 -name "*.csv"); do 
	cp $f ~/owl_data/current.csv
	mysql -u root --password="" \
	-e "source scripts/sql/2021.sql;"
done

echo "Done moving files"