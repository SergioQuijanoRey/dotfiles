for x in $*
do
sed -e "s/#b3b3b3/#dfdfdf/g" $x > temp$x
mv temp$x $x
done 
