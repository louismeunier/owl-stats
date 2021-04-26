sed -i'' 's/+/|/g' $1
sed -i'' '1d' $1
sed -i'' '$d' $1