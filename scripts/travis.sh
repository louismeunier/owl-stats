sudo apt-get install chromium-driver

# download data from owl and unzip to own folders
mkdir ~/owl_data ~/owl_data/2018 ~/owl_data/2019 ~/owl_data/2020 ~/owl_data/2021

# we have to use a webscraper to get OWL data, unfortunately
# this is because there is no permalink, and the links change every time data is updated
ruby /home/travis/build/louismeunier/owl-stats/scripts/scraper.rb

unzip 2018.zip -d ~/owl_data/2018
unzip 2019.zip -d ~/owl_data/2019
unzip 2020.zip -d ~/owl_data/2020
unzip 2021.zip -d ~/owl_data/2021

echo "Unzipped all files"