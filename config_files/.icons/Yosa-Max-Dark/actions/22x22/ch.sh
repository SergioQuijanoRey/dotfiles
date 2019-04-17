for x in $*
do
sed -e "s/#5c616c/#dfdfdf/g" $x > temp$x
mv temp$x $x
done 
