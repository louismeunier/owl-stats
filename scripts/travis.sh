# download data from owl and unzip to own folders
mkdir ~/owl_data ~/owl_data/2018 ~/owl_data/2019 ~/owl_data/2020 ~/owl_data/2021

curl https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/bltc1b83b55692b42f4/5e4c1368de213a0dff736e29/phs_2018.zip --output 2018.zip

echo "Downloaded 1/4"

curl https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/blt034e0b484f2dae47/5e4c1369b6a7c40dd9c69e9f/phs_2019.zip --output 2019.zip

echo "Downloaded 2/4"

curl https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/bltd343b3d398dff24c/607df9757d31670cde6a1bc0/phs_2020.zip --output 2020.zip

echo "Downloaded 3/4"

curl https://assets.blz-contentstack.com/v3/assets/blt321317473c90505c/blt55ce758367c30cd9/607df970286a240c9d2b4025/phs_2021.zip --output 2021.zip

echo "Downloaded 4/4"

unzip 2018.zip -d ~/owl_data/2018
unzip 2019.zip -d ~/owl_data/2019
unzip 2020.zip -d ~/owl_data/2020
unzip 2021.zip -d ~/owl_data/2021

echo "Unzipped all files"