for x in $*
do
sed -e "s/#5c616c/#4d4d4d/g" $x > temp$x
mv temp$x $x
done 
