for x in $*
do
sed -e "s/#bebebe/#4d4d4d/g" $x > temp$x
mv temp$x $x
done 
