wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
wget https://chromedriver.storage.googleapis.com/90.0.4430.24/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo apt-get --only-upgrade install google-chrome-stable
sudo cp chromedriver /usr/local/bin/.
sudo chmod +x /usr/local/bin/chromedriver