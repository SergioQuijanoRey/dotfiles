for x in $*
do
sed -e "s/#bebebe/#dfdfdf/g" $x > temp$x
mv temp$x $x
done 
