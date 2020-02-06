make filosofos
mpirun -np 4 --oversubscribe ./filosofos
make exe_filosofos
htop
rm filosofos
ls
gcommit
git push
make camareros
make exe_camareros
gcommit -m "Soluciono un error logico"
make camareros
mpirun -np 10 --oversubscribe ./camareros
mpirun -np 5 --oversubscribe ./camareros
make camareros
mpirun -np 5 --oversubscribe ./camareros
gcommit -m "La solucion con camareros produce un interbloqueo muy raro"
git push
nv
nv camareros
nv
update
updateGit
gpush
cdf
ls
nv
cat *Dic*
make camareros
mpirun --np 5 ./camareros
mpirun --np 5 --oversubscribe ./camareros
make camareros && mpirun -np 5 --oversubscribe ./camareros
gcommit
git push
glog
gcommit
gpush
make camareros && mpirun -np 5 --oversubscribe ./camareros
make camareros && mpirun -np 7 --oversubscribe ./camareros
make exe_camareros
rm camareros
ls
rm traza_bloqueante.png 
gpush
nv
ls
ls Scripts/
ls
sqlite3 Databases/empresas.db 
sqlite3 Databases/empresas.db < Scripts/ejercicio_3_9.sql 
sqlite3 Databases/empresas.db 
sqlite3 Databases/empresas.db < Scripts/ejercicio_3_9.sql 
sqlite3 Databases/empresas.db < Scripts/ejercicio_3_10.sql 
sqlite3 Databases/empresas.db < Scripts/ejercicio_3_11.sql 
sqlite3 Databases/empresas.db < "SELECT COUNT(*) FROM proveedor";
sqlite3 Databases/empresas.db < "SELECT COUNT(*) FROM proveedor;"
sqlite3 Databases/empresas.db < echo "SELECT COUNT(*) FROM proveedor;"
sqlite3 Databases/empresas.db < $(echo "SELECT COUNT(*) FROM proveedor;")
sqlite3 Databases/empresas.db <(echo "SELECT COUNT(*) FROM proveedor;")
sqlite3 Databases/empresas.db "SELECT COUNT(*) from proveedor;
"
sqlite3 Databases/empresas.db "SELECT COUNT(*) from proveedor;"
sqlite3 Databases/empresas.db "SELECT * from proveedor;"
sqlite3 Databases/empresas.db "SELECT * from ventas, proveedor WHERE ventas.codpro == proveedor.codpro;"
sqlite3 Databases/empresas.db "SELECT ventas.codpro, codpie, codpj, cantidad, fecha, nompro, status from ventas, proveedor WHERE ventas.codpro == proveedor.codpro;"
sqlite3 Databases/empresas.db 
sqlite3 Databases/empresas.db "
SELECT ventas.codpro, ventas.codpie, ventas.codpj
FROM ventas, proveedor, proyecto, pieza
WHERE 
ventas.codpro == proveedor.codpro AND 
ventas.codpie == pieza.codpie AND
ventas.codpj == proyecto.codpj AND
pieza.ciudad == proveedor.ciudad AND
proveedor.ciudad == proyecto.ciudad;
"
SELECT codpie, codpro, codpj
sqlite3 Databases/empresas.db "
SELECT codpie, codpro, codpj
FROM pieza, proveedor, proyecto
WHERE
pieza.ciudad == proveedor.ciudad AND
proveedor.ciudad == proyecto.ciudad;
"
SELECT ciudad FROM pieza WHERE codpie=="P2";
sqlite3 Databases/empresas.db "
SELECT codpie, codpro, codpj
FROM pieza, proveedor, proyecto
WHERE
pieza.ciudad == proveedor.ciudad AND
proveedor.ciudad == "Londres" AND;
"
sqlite3 Databases/empresas.db 
nv *SQL*
cdf
gpush
nv
touch "Tema 5 - Diagramas UML.md"
nv 
pacman -Ss nn
pacman -Ss nnn
sudo pacman -S nnn
nnn
nv
ranger
nv
font
ffprobe 
nv .config/termite/config 
ls
pacman -Ss source-code-pro
sudo pacman -S extra/adobe-source-code-pro-fonts
nv .config/termite/config 
fc-list
fc-list | grep source
fc-list | grep source | nv -
nv
nv Tema\ 4.md 
nv
gcommit
make exe_propia
ls
make exe_propia
make propia
mpirun -np 4 --oversubscribe ./propia
rm propia
gcommit
git push
update
updateGit
gpush
cd
cdf
ls
nv *Dic*
cat *Dic*
invertcsv Movimientos.csv Movimientos.csv 
gpush
nv
sqlite3 Databases/empresas.db 
sqlite3 Databases/empresas.db
nv
gpush
cdf
ls
nv
cat *Dic*
gpush
cdf
ls
nv
cat *Dic*
sqlite3 Databases/empresas.db 
nv
nv
findps discrod
findps discord
pacman -Ss unity
pacman -Ss unity web
pacman -Ss unity | nv
aur -Ss unity
yay -Ss unity
yay -Ss unity web
yay -Ss unity | nv
pacman -Qi firefox
update
updateGit
gpush
cdf
ls
nv
cat *Dic*
gpuhs
gpush
cdf
nv
cat *Dic*
cdf
gpush
sqlite3 Databases/empresas.db 
nv
nv
:w
nv
:wq
gpush
cdf
nv
cat *Dic*
findps firefox
sudo kill -9 5522
findps firefox
findps
findps exile
findps steam
sudo killall steam
htop
gpuhs
gpush
update
cdf
ls
nv
ls
cat *Dic*
ranger
pacman -Qi python
gcommit
git push
make
make exe_productor
mpirun -np 3 --oversubscribe ./productor
make productor
mpirun -np 3 --oversubscribe ./productor
make productor
mpirun -np 3 --oversubscribe ./productor
make
make exe_productor
ls
make clean
ls
gpush
gcommit
make exe_filosofos
make filosofos
mpirun -np 4 --oversubscribe ./filosofos
ls
make clean
ls
gpush
make exe_propia
make propia
mpirun -np 4 --oversubscribe ./propia
gcommit
git push
ls
make clean
make exe_camareros
mpirun -np 5 --oversubscribe ./camareros
make clean
gpuhs
gpush
nv
pacman -Qi ranger
sudo pacman -S ranger
ranger
cd ..
ls
cd ..
gpush
sqlite3 Databases/empresas.db 
nv
nv
sqlite3 Databases/empresas.db 
gpush
printf '\e]50;# LibreBaskerville\a'
printf '\e]50;# Source Code Pro\a'
traceroute google.es
pacman -Ss traceroute
sudo pacman -S core/traceroute
traceroute google.es
traceroute google.jp
man traceroute
traceroute danielsergio.duckdns.org
arp
nv
:wq
tetris
mpicxx camarero4.cpp -o camarero && mpirun -np 9 --oversubscribe ./camarero
mpicxx camarero4.cpp -o camarero && mpirun -np 11 --oversubscribe ./camarero
mpicxx camarero4.cpp -o camarero
mpirun -np 11 --oversubscribe ./camarero
mpicxx camarero4.cpp -o camarero && mpirun -np 11 --oversubscribe ./camarero
ls
mpicxx camarero4.cpp -o camarero && mpirun -np 11 --oversubscribe ./camarero
nv
update
updateGit
nvf
cdf
nv
htop
gotop
lex pruebas.lex 
lex pruebas.lex pruebas.lex 
lex pruebas.lex < pruebas.lex
ls
gcc lex.yy.c -o pruebas -ll
ls 
gcc lex.yy.c -o pruebas -lfl
ls
./pruebas pruebas.lex
rm pruebas.*
ls
rm *.yy.c
ls
rm pruebas
ls
flex
pacman -Qi flex
flex pruebas.lex 
ls
gcc lex.yy.c -o decimales -lfl
ls
./decimales pruebas.lex 
flex pruebas.lex 
gcc lex.yy.c -o decimales -lfl
flex pruebas.lex 
gcc lex.yy.c -o decimales -lfl
flex pruebas.lex 
gcc lex.yy.c -o decimales -lfl
./decimales pruebas.lex 
cdf
las
ls
cd ..
ls
sqlite3 Databases/empresas.db 
sqlite3 Databases/baloncesto.db 
cdf
cd ..
ls
ls Scripts/
sqlite3 Databases/baloncesto.db Scripts/insert_values_baloncesto.sql 
sqlite3 Databases/baloncesto.db ./Scripts/insert_values_baloncesto.sql 
sqlite3 Databases/baloncesto.db < Scripts/insert_values_baloncesto.sql 
sqlite3 Databases/baloncesto.db 
man sqlite
man sqlite3
sqlite3 Databases/baloncesto.db 
sqlite3 Databases/baloncesto.db s
sqlite3 Databases/baloncesto.db
.tables
sqlite3 Databases/baloncesto.db
cdf
ls
sqlite3 Databases/baloncesto.db
ls
file baloncesto.db 
sqlite3 baloncesto.db 
sqlite3 empresas.db 
git clone git@github.com:SergioQuijanoRey/PracticasLEX.git
ls
cd PracticasLEX/
ls
nv README.md
gpush
nv pruebas.lex
ls
flex procesador.lex 
g++ lex.yy.c -o pruebas -lfl
flex procesador.lex 
g++ lex.yy.c -o pruebas -lfl
flex procesador.lex 
g++ lex.yy.c -o pruebas -lfl
flex procesador.lex 
g++ lex.yy.c -o pruebas -lfl
g++ lex.yy.c -o pruebas -ll
g++ lex.yy.c -o pruebas -lfl
flex procesador.lex 
g++ lex.yy.c -o pruebas -lfl
gcc lex.yy.c -o pruebas -lfl
flex procesador.lex 
gcc lex.yy.c -o pruebas -lfl
flex procesador.lex 
gcc lex.yy.c -o pruebas -lfl
./pruebas pruebas
flex procesador.lex 
gcc lex.yy.c -o pruebas -lfl
g++ lex.yy.c -o pruebas -lfl
man flex
lex
flex++ procesador.lex 
ls
g++ lex.yy.cc -lfl -o pruebas
flex++ procesador.lex 
g++ lex.yy.cc -lfl -o pruebas
flex++ procesador.lex 
g++ lex.yy.cc -lfl -o pruebas
flex++ procesador.lex 
g++ lex.yy.cc -lfl -o pruebas
flex++ procesador.lex 
flex procesador.lex 
gcc lex.yy.c -o pruebas -lfl
ls
./pruebas
make
make exe
make
ls
./pruebas
make
ls
make clean
ls
rm 
rm *.cc
ls
make exe
make exe > pruebas.txt
cat pruebas.txt 
rm pruebas.txt 
make exe
./procesador ../Ficheros\ de\ prueba/ejemplo_jugadores.txt 
make exe
make clean
ls
rm procesador
make exe
rm procesador
make exe
ls
./procesador ../Ficheros\ de\ prueba/piezas.txt 
make procesador
./procesador ../Ficheros\ de\ prueba/piezas.txt 
cd
cdf
ls
sqlite3 
ls
sqlite3 empresas.db 
nv pruebas.sql
nvf
nv
cd ..
gpush
cdf
nvf
cat *Dic*
ls
sqlite3 Databases/empresas.db 
nv
nv
cdf
ls
nv .bash_functions 
gpush
cdf
ls
nv
cat *Dic*
man route
route
nv /etc/network/interfaces
sudo nv /etc/network/interfaces
sudo nvim /etc/network/interfaces
ping google.es
sqlite3 Databases/empresas.db 
nv
update
nv .config/nvim/init.vim 
cdf
cd .i3/
ls
nv i3blocks.conf 
date
sudo pacman -S ntp
sudo timedatectl set-ntp true
gpush
ranger
gpush
cdf
ls
nv
cat *Dic*
nv
cat *Dic*
uname -a
ip a
echo $0
echo $0
ls
ls -a
source .bashrc
ls
pwd
ls -a
source .bashrc 
source .bash_aliases 
sh
echo $0
nv .config/vifm/vifmrc 
pacman -Ss vifm
sudo pacman -S vifm
vifm
> file
ls
cat file
rm file
< steam.desktop 
cat steam.desktop 
< steam.desktop 
$<(steam.desktop)
updateGit
update
extract scd-p4-fuentes.zip 
update
updateGit
gpush
cdf
cat *Dic*
lsblk
cat *Dic*
cdf
ls
nv 
cat *Dic*
gpush
cdf
ls
nv
cat *Dic*
updateGit
gotop
man xz
update
compile ejecutivo1.cpp -o pruebas
./pruebas
nv
ls
compile ejecutivo1-compr.cpp -o pruebas
./pruebas
compile ejecutivo1-compr.cpp -o pruebas
./pruebas
gpuhs
gpush
compile ejecutivo2.cpp -o pruebas
./pruebas
compile ejecutivo2.cpp -o pruebas
./pruebas
gpush
compile ejecutivo2.cpp -o pruebas
gpush
./pruebas
gpush
compile ejecutivo2.cpp -o pruebas
./pruebas
gpush
zip -r Ejercicios_Sergio_Quijano.zip .
ls
zip -r Ejercicios_Sergio_Quijano.zip .
ls
zip -r Ejercicios_Sergio_Quijano.zip .
nv
gpush
cdf
ls
nv
cat *Dic*
nv
gpush
pacman -Ss netflix
yay -Ss netflix
cdf
ls
nv
cat *Dic*
gpush
nv
gpush
make
ls
cat Makefile 
make exe
make exe ../test_files/ejemplo_jugadores.txt 
make exe ../test_files/piezas.txt 
ls
./procesador ../test_files/piezas.txt 
./procesador ../test_files/ejemplo_jugadores.txt 
make exe ../test_files/piezas.txt 
./procesador ../test_files/ejemplo_jugadores.txt 
make exe ../test_files/piezas.txt 
./procesador ../test_files/ejemplo_jugadores.txt 
ls
rm procesador
make procesador
ls
make procesador
ls
./procesador ../test_files/ejemplo_jugadores.txt 
./procesador ../test_files/piezas.txt 
gpush
ls
rm procesador
make clean
ls
zip -r ~/seguridad.zip .
make procesador
./procesador ../test_files/piezas.txt 
ls
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
rm procesador
./procesador ../test_files/piezas.txt 
make procesador
ls
make procesador
./procesador ../test_files/piezas.txt 
ls
make clean
cat Makefile 
make clean ; make exe
ls
make clean
ls
make clean
ls
make clean ; make exe
ls
make clean
ls
make exe
ls
make clean
lsl
s
ls
make clean ; make exe
alias asegurar="make clean ; make exe"
asegurar
ls
asegurar 
ls
asegurar 
make clean
ls
asegurar 
gpush
ls
alias asegurar="make clean ; make exe"
asegurar 
make clean
ls
make procesador
./procesador ../test_files/piezas.txt 
gcommit -m "Consigo que el prompt sea cualquier cosa que contenga sql"
make clean
make exe
cat ../test_files/piezas.txt 
make exe
cat ../test_files/piezas.txt 
make exe
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
gpush
./procesador ../test_files/ejemplo_jugadores.txt 
gcommit
gpush
make exe
./procesador ../test_files/eme
./procesador ../test_files/ejemplo_jugadores.txt 
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
make procesador
./procesador ../test_files/piezas.txt 
make exe
gpush
cdf
nv
cdf
nv
cdf
ls
sqlite3 baloncesto.db 
make proesador
make procesador
./procesador ../test_files/jugadores_switch.text 
cat ../test_files/jugadores_switch.text 
push
gpush
make procesador
make exe
./procesador ../test_files/jugadores_switch.text 
make procesador
./procesador ../test_files/jugadores_switch.text 
make procesador
./procesador ../test_files/jugadores_switch.text 
make exe
./procesador ../test_files/ejemplo_jugadores.txt 
gpush
make procesador
./procesador ../test_files/ventas.txt 
make procesador
./procesador ../test_files/ventas.txt 
make exe
./procesador ../test_files/ventas.txt 
make procesador
./procesador ../test_files/ventas.txt 
cat ../test_files/ventas.txt 
make procesador
./procesador ../test_files/ventas.txt 
gpush
make exe
for file in ../test_files/ do; ./procesador "../test_files/$file"
for file in ../test_files/ do; ./procesador "../test_files/$file" ; done
./procesador 
ls
make procesador
for file in ../test_files/; do echo "$file"; done
for file in $(ls ../test_files/) do; ./procesador "../test_files/$file"
for file in $(ls ../test_files/) do; ./procesador ../test_files/$file
ls
./procesador ../test_files/ejemplo_jugadores.txt 
./procesador ../test_files/
./procesador ../test_files/ejemplo_jugadores.txt 
./procesador ../test_files/piezas.txt 
./procesador ../test_files/ventas.txt 
make procesador
./procesador "../test_files/jugadores.txt" 
for file in $(ls ../test_files/); do ./procesador "../test_files/$file"; done
gpush
cdf
nv
gpush
cdf
ls
cd Documento/
ls
pandoc Documento.md -o Documento.pdf
xprop
zip -r Practica_Lex.zip ./Codigo ./Documento ./test_files/
cdf
ls
sqlite3 empresas.db 
gpush
cd .i3/scripts/lockscreen 
cd .i3/scripts/
nv lockscreen 
updateGit
nv
gpush
py
vifm
update
:q
echo $DISPLAY
man DISPLAY
nvf
ls
ll
ls
htop
nv Downloads/config.txt 
pacman -Qi clip
pacman -Qi clip*
pacman -Qi *clip*
pacman -Qi xclip
pacman -Qi 
pacman -Qi
pacman -Q
pacman -Q | grep clip
pacman -Ss xclip
sudo pacman -S xclip
xclip
updateDotfiles 
confi3
man termite
ls
ls Downloads/
termite -c ./Downloads/config.txt 
ls
cd Downloads/
nv
cd 
termite -c ./Downloads/config.txt 
ls
cd Downloads/
ls
rm config.txt 
nvconf 
ds Fotografias/
lsblk
sudo mount /dev/sdb1 /media/USB/
lsblk
sudo umount /media/USB/
sudo umount -f /media/USB/
ds LinuxCloud/
rsync -zaP --dry-run /media/USB/LinuxCloud/ LinuxCloud/
rsync -zaP --dry-run ~/LinuxCloud/ /media/USB/LinuxCloud/
rsync -zaP /media/USB/
rsync -zaP /media/USB/LinuxCloud/ ~/LinuxCloud/

rsync -zaP --dry-run /media/USB/LinuxCloud/ ~/LinuxCloud/
lsblk
sudo mount /dev/sdc1 /media/USB 
ds LinuxCloud/
cdf
ls
cat *Dic*
update
updateGit
ls
ls -a
cd /root
ls
sudo cd /root
ls
sudo su
cwd
cw
pwd
mariadb
mysql -u root -p
sudo pacman -S mysql
mysql -u root -p
sudo mysql_secure_installation 
sudo systemctl status mariadb.service
sudo systemctl start mariadb
sudo systemctl start mariadbd
sudo systemctl start mariadb.service
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysql -u root -p
sudo mysql -u root -p
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
mysql_upgrade 
sudo mysql_upgrade 
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo mysql_upgrade
sudo systemctl start mariadb
sudo mysql_upgrade
mysql -u root -p
sudo mysql -u root -p
cdf
s
ls
cd ..
ls
mkdir MariaDatabases
cd MariaDatabases/
sudo mysql -u root -p
ls
tar -xvf pcc-appcenter-9.1.3-dbschema.tar
ls
ls -a
ls
sudo mysql -u root -p
man mariadb
mariadb
mariadb -p root
sudo mariadb -p root
sudo mariadb -u root 
sudo mariadb -u root empresas
sudo mariadb
mariadb
mariadb -p
mariadb -u sergio -p
sudo mariadb -u root
mariadb
mariadb -p
sudo mariad
sudo mariadb
mysql
mysql -p
sudo maridb
sudo mariadb
mariadb
mariadb -p
sudo vi /etc/pacman.conf
cdrf
cdf
ls
cd
cdf
ls
mysql -p empresas
yay -Ss sqlplus
yay -S aur/oracle-instantclient-sqlplus
sudo pacman -Syyu
yay -S aur/oracle-instantclient-sqlplus
pacman -Ss sqlplus
sudo pacman -S oracle/oracle-instantclient-sqlplus
sqlplus 
man sqlplus
help sqlplus
man -k sqlplus
info sqlplus
info
pacman -Ss sqldeveloper
sudo pacman -S oracle/oracle-sqldeveloper
sudo pacman -Rns oracle/oracle-sqldeveloper
ls
sqlplus 
sudo sqlplus
lf
pacman -Ss lf
sqlplus x2103503@practbd.oracle0.ugr.es
sqlplus x2103503@oracle0.ugr.es
sqlplus oracle0.ugr.es@practbd.oracle0.ugr.es
extract instantclient-basic-linux.x64-19.5.0.0.0dbru.zip 
unzip instantclient-sqlplus-windows.x64-19.5.0.0.0dbru.zip 
ls 
chmod u+x bases_datos 
nv bases_datos 
./bases_datos 
nv bases_datos 
bases_datos 
unzip instantclient-basic-linux.x64-19.5.0.0.0dbru.zip 
bases_datos 
nv
bases_datos 
gpush
cdf
cat *Dic*
pacman -Ss sql-developer
pacman -Ss oracle-developer
pacman -Ss sql
sudo pacman -S oracle/oracle-sqldeveloper oracle/oracle-instantclient-tools
sudo pacman -S oracle/oracle-instantclient-tools
bases_datos 
gpush
gotop
cdf
nv
bases_datos 
sqlplus /nolog
sqlplus 
sqlplus /nolog
ls
cd bin/
ls
nv bases_datos 
base
bases_datos 
nv bases_datos 
gpush
cdf
ls
nv
gcommit
terminator
cdf
ls
cdf
ls
cd Scripts/
ls
nv ejercicio_24.sql
ifconfig
wifi
man wifi
wifi off
sudo wifi off
sudo wifi on
gpush
gcommit
cdf
nv
gpush
cdf Diarios
cdf 
ls
nv
gpush
update
updateGit
update
py
ls
unzip
unzip FR_TemasTeoria.zip 
cd ..
cd ,,
cd ..
gpush
pandoc Tema\ 1.md -o ~/Tema\ 1.pdf
ls ~
brave Tema\ 1.md &
unterminal
ds VirtualImages/
man puts 
man socket
man 2 socket
htop
cd GitProjects/
ls
cd PracticasLEX/
ls
zip -r ~/lucia.zip .
gpush
cdf
ls
nv
htop
ls
rm lucia.zip 
gpush
cdf
ls
nv
htop
gcommit
cdf
ls
nv
update
nv
gpush
snap
pacman -Ss snap
gpuhs
gpush
cdf
ls
nv
ping google.es
updateGIt
updateGig
updateGit
pacman -Ss mastodon
yay -Ss mastodon
actualizar
update
updateGit
gpush
cdf
ls
nv *Ener*
touch "Diario 2020 01 - Enero.md"
nv 
gpush
cdf
ls
nv
unzip *.zip
for file in *.zip; do unzip $file; done
for file in *.zip; do unzip $file; done
updateGit
update
gpush
cdf
ls
nv
charges
pacman -Ss charges
yay -Ss charges
update
updateGit
gpush
cdf
nv
updateGit
update
gpush
cdf
ls
nv
update
updateGit
find ~ -name *.mp4
ls
ls -a
cd .cache/
ls
cd ..
ls
find ~ -name *whatsapp*
cd /home/sergio/.cache/yay/whatsapp-nativefier
ls
ls PKGBUILD 
cat PKGBUILD 
find ~ -name *.avi
find ~ -name *.dvi
man find
htop
update
updateGit
gpush
cdf
ls
nv
gpush
cdf
ls
nv
update
updateGit
findps firefox
killall firefox
gpush
cdf
nv
man sendmail
man sendiso
ls
cdf
updateGit
update
updateGit
pdate
update
gpush
cdf
ls
nv
range
ranger 
whois 78.31.8.101
whois -b 78.31.8.101
whois 172.194.34.206
whois 150.214.204.25
iptables
iptables show
iptables -h
ifconfig
man dd
ping google.es
cdf
git log
git show b6a9bf432c5adea62aaae032db88462c29e23d98
q
man git show
gpush
cdf
nv
gpush
cdf
ls
nv
cdf
nv 
updateGit
gpush
cdf
nv
update
ls -a
caat steam.desktop 
cat steam.desktop 
man xargs
*
cat *
echo *
echo * \n
ls | reverse
ls | sort -r 
ls | sort -r | cat
ls | sort -r | xargs cat 
1;120;120;1;0x1;1;120;120;1;0x65;1;9c0$y
$(ls -r)
car $(ls -r)
cat $(ls -r)
echo $(ls -r)
ulimit -s
for file in *; do echo "$file" > "${file}.pruebas"; done
ls
ls *.pruebas
rm *.pruebas
ls
ls -a
for file in $(ls -a); do echo "$file"; done
update
nv
updateGit
gpush
cdf
nv
cdf
ls
nv
extract Relaciones\ Resueltas.zip 
extract "Relaciones\ Resueltas.zip"
unzip "Relaciones Resueltas.zip" 
update
updateGit
gpush
cdf
gpush
cdf
nvf
ls
cd
ls
cd bin
ls
cat bases_datos 
bases_datos 
nv bin/bases_datos 
nv
sqlite3 Databases/empresas.db 
sqlplus 
ls
bases_datos 
sqlite3 Databases/empresas.db 
cdf
ls
cat README.md 
cd PR
cd PracticasSQL/
ls
cat algebraCalculo_eje6.md 
nv algebraCalculo_eje6.md 
bases_datos 
cat bin/bases_datos 
sqlplus conn x2103503/x2103503@//oracle0.ugr.es:1521/practbd.oracle0.ugr.es
sqlplus x2103503/x2103503@//oracle0.ugr.es:1521/practbd.oracle0.ugr.es
nv bin/bases_datos 
ls
sqlite3 Databases/empresas.db 
bases_datos 
cd Scripts/
bases_datos 
gpush
git add Apuntes\ SQL.md 
git commit
git push
gpush
git pull
git add .
git commit
git push
nv
nvconf 
bases_datos 
ls
cd Scripts/
ls
bases_datos 
ls
bases_datos 
nvconf 
updateDotfiles 
cdf
cd ..
ls
nv
gpush
cdf
nv
cdf
ls
git pull
glog
git show b1406e4508ece36baf9dd27f73a75b52884b2172
cd PracticasSQL/
s
ls
vi capitulo3.sql 
nv capitulo3.sql 
cd .i3/scripts/
ls
rm dualdisplay
mv dualdisplay.sh dualdisplay
ls
ls -a
ls -la
ls
cdf
git pull
glog
git show d86270978ceb9636c1ce7da220e71e7f57d05
glog
git show e9dd86270978ceb9636c1ce7da220e71e7f57d05
:q
killall fir
killall firefox
nvf
pwd
ls
mkdir Scripts/Ejercicios
mv Scripts/ejercicio_* Scripts/Ejercicios/
ls
ls Scripts/
mkdir Scripts/Ejemplos
rmdir Scripts/Ejemplos/
rm Scripts/ejemplo_3_18.sql 
ls
,
cdf
ls
pandoc "Apuntes SQL.md" -o "Apuntes SQL.pdf"
evince Apuntes\ SQL.pdf &
unterm
unterminal 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_1.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_2.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_3.sql 
sqlite3 Databases/empresas.db "SELECT * FROM pieza"
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_4.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_5.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_6.sql
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_7.sql
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_9.sql
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_10.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_11.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_12.sql 
cdf
ls
cd 
cdf
ls
cdf
ls
sqlite3 empresas.db ~/GitProjects/DGIIM3/C1/FBD/PracticasSQL/capitulo3.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_14.sql 

sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_14.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_16.sql 
nv
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_21.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_23.sql 
sqlite3 Databases/empresas.db "SELECT codpie, peso FROM pieza;"
ls
sqlite3 Databases/empresas.db < ~/pruebas.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_28.sql 
sqlite3 Databases/empresas.db < ~/pruebas.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_30.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_31.sql 
sqlite3 Databases/empresas.db < ~/pruebas.sql 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_36.sql 
sqlite3 Databases/empresas.db 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_36.sql 
sqlite3 Databases/empresas.db 
sqlite3 Databases/empresas.db < Scripts/Ejercicios/ejercicio_3_36.sql 
sqlite3 Databases/empresas.db 
py
bv
nv
cdf
ls
nv capitulo3.sql 
gpush
updateGit
update
mimetype 
mimetype arrimadas.jpeg 
mimetype .sqlite
mimetype .sqliterc 
mimetype .profile
man mimetyope
man mimetype
gpush
cdf
ls
nv
gpush
cdf
ls
nv
sudo pacman -S audacity
ls
py 
N
nv pruebas.code
ls
gpc
man pascal
nv pruebas.code
update
updateGit
py
gpush
cdf
nv
nv pruebas.cv
nv pruebas.csv
ls
cd GitProjects/dotfiles/
ls
cd installation_files/
ls
nv 
update
updateGit
py
dijkstra 
man dijkstra
size LinuxCloud/
ls
ds LinuxCloud/
lsblk
sudo mount /dev/sdb1 /media/USB/
lsblk
rsync -zaP /run/media/sergio/TOSHIBADRIVE/LinuxCloud/ ~/LinuxCloud/
sudo rsync -zaP /run/media/sergio/TOSHIBADRIVE/LinuxCloud/ ~/LinuxCloud/
killall kdenlive
gpush
cdf
ls
nv
localssh 
nv .profile
localssh 
nv Vlogs\ Viaje\ Rumanía\ 2019.zip 
unzip Vlogs\ Viaje\ Rumanía\ 2019.zip 
nv
ds LinuxCloud/
ssh $LOCALIP
nv
ssh $LOCALIP
localssh 
rclone
man rclone
cd .i3/scripts/
ls
rm bigdisplay
mv bigdisplay.sh bigdisplay
ls
make mandelbrot && ./mandelbrot 
g++ sdl2-config --libs --cflags mandelbrot.cpp -o mandelbrot
pacman -Ss sdl
pacman -Ss sdl | nv
sdl2-config 
man sdl2
info sdl
info sdl2
make mandelbrot && ./mandelbrot 
hg
man hg
py pruebas.py 
ls
man hg
py pruebas.py 
py
py pruebas.py 
py pruebas.p
py pruebas.py
py
py pruebas.py
sdl
sudo find / -name sdl
qt
qt5ct 
py pruebas.py
cdf
ls
nv Cpp\ Cheatsheet.md 
ls
mv pruebas.py mandelbrot.py
gcc mandelbrot.cpp -lSDL2 -lSDL2main -o sdl2minimal
g++ mandelbrot.cpp -o mandelbrot
g++ -lSD2main mandelbrot.cpp -o mandelbrot
g++ -lstdc++ mandelbrot.cpp -o mandelbrot
g++ -lstd mandelbrot.cpp -o mandelbrot
g++ -lstdc mandelbrot.cpp -o mandelbrot
g++ -lstdc++ mandelbrot.cpp -o mandelbrot
man sdl
man stdl
g++ mandelbrot.cpp -o mandelbrot sdl2-config --cflags --libs
g++  sdl2-config --cflags --libs mandelbrot.cpp -o mandelbrot
g++  sdl2-config mandelbrot.cpp -o mandelbrot
g++  "sdl2-config" mandelbrot.cpp -o mandelbrot
make pruebas
rm pruebas
rm pruebas*
ls
ls
make mandelbrot && ./mandelbrot 
nv
man shutdown
sudo shutdown +25
ls
make mandelbrot && ./mandelbrot
ls
cat points.csv 
rm points.csv 
make mandelbrot && ./mandelbrot
cat points.csv 
py pruebas.py 
py
py pruebas.py 
make mandelbrot && ./mandelbrot
py pruebas.py 
make mandelbrot && ./mandelbrot
cat points.csv 
head -5 points.csv 
py pruebas.py 
make mandelbrot && ./mandelbrot
py pruebas.py 
nv mandelbrot.cpp 
git clone git@github.com:SergioQuijanoRey/MandelbrotVisualizer.git
gpush
make mandelbrot
./mandelbrot 
make mandelbrot
./mandelbro
./mandelbrot
cat points.csv 
grep points.csv 0
grep 0 points.csv
grep 100 points.csv
nv points.csv 
make mandelbrot
./mandelbrot
nv points.csv 
rm points.csv 
./mandelbrot
nv points.csv 
ls
py visualizer.py 
head -4 points.csv 
py visualizer.py 
make mandelbrot
./mandelbrot 
ks
rm points.csv 
./mandelbrot 
cat points.csv 
py visualizer.py 
ls
py mandelbrot.py
less points_prueba.csv 
py visualizer.py 
py mandelbrot.py
make mandelbrot
ls
rm *.csv
./mandelbrot 
cat points.csv 
py visualizer.py 
make mandelbrot && ./mandelbrot 
make mandelbrot && ./mandelbrot | grep 2
make mandelbrot && ./mandelbrot | grep 3
make mandelbrot && ./mandelbrot | grep 20
make mandelbrot && ./mandelbrot | nv -
make mandelbrot && ./mandelbrot 
rm points.csv 
make mandelbrot && ./mandelbrot 
head -10 points.csv 
nv points.csv 
                           make mandelbrot && ./mandelbrot 
ls
rm points.csv 
make mandelbrot && ./mandelbrot 
head -10 points.csv 
py visualizer.py 
make mandelbrot && ./mandelbrot 
py visualizer.py 
gpush
py mandelbrot.
py mandelbrot.py
nv mandelbrot
gpush
nv
htop
killall kdenlive
htop
psfind kdenlive
pgrep kdenlive
sudo kill -9 1444
gpush
gpushj
gpush
pydoc3.8 mandelbrot.py 
pydoc mandelbrot.py 
pydoc -w mandelbrot
py mandelbrot.p
py mandelbrot.py
gpush
ls
ls -a
rm -rf __pycache__/
ls
gpush
ls
make mandelbrot
./mandelbrot 
py visualizer.py 
ls
rm mandelbrot points.csv 
ls
gpush
gpush 
gpush
ls
pandoc README.md -o README.pdf
ls
evince README.
evince README.pdf 
gpush
pandoc README.md -o README.pdf
gpush
pandoc README.md -o README.pdf
gpush
nv
gpush
updateGit
update
ffmpeg -i foobar.mkv -vcodec copy -acodec copy foobar.mp4
for file in * do; ffmpeg -i $file -vcodec copy -acodec copy $file.mp4
for file in * do; ffmpeg -i $file  $file.mp4
basename parte_1.mkv 
basename parte_1.mkv .mkv
for file in * ; do f="$(basename $file .mkv)
ffmpeg -i $file "$f.mp4"
done
done
;
ffmpeg -i parte_1.mkv parte_1.mp4 
ls
rm *.mp4
ls
cdf
ls
nv Cpp\ Cheatsheet.md 
nv Bash\ cheatsheet.md 
py pruebas.py 
nv pruebas.py
ls
rm pruebas.py 
nv pruebas.py
py pruebas.py 
pip3.8 install numpy
sudo pip3.8 install numpy
py pruebas.py 
matplotlib
sudo pip3.8 install matplotlib
py pruebas.py 
py
sudo pip3.8 install scipy
py pruebas.py 
rm pruebas.py 
localssh 
rsync LinuxCloud/EditingProjects/ sergio@$LOCALIP:~/LinuxCloud/EditingProjects/
rsync -zaP LinuxCloud/EditingProjects/ sergio@$LOCALIP:~/LinuxCloud/EditingProjects/
localssh 
ranger
localssh 
gpush
cdf
ls
nv
cd ..
s
ls
cd ..
ls
gpush
localssh 
nv fallos.txt
localssh 
ls
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
ls
rm fallos.txt 
cdf
ls
vlc parte_1.mp4 
vlc parte_1.mkv 
localssh 
gpush
cd Des
cd Downloads/
ls
ds Telegram\ Desktop/
gpush
localssh 
nv fallos.txt
ls
localssh 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
localssh 
cdf
ls
vlc parte_2.mp4 
localssh 
localssh 
man kdenlive_render 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
cdf
ls
vlc parte_2.m
vlc parte_2.mp4 
vlc parte_3.mp4 
vlc parte_4.m
vlc parte_4.mp4 
localssh 
gpush
cdf
ls
nv
cdf
ls
kdenlive_render part1_project_script.mlt 
kdenlive_render src part1_project_script.mlt 
kdenlive_render render part1_project_script.mlt 
ls
nv part1_project_script.mlt 
ls
cd ..
ls
cd Projects/
ls
cd SnippetsOfCode01/
ls
nv part1_project.kdenlive 
cd ..
ls
cd ..
cd Scripts/
ls
rm *
ls
cd ..
ls 
tree Finals/
tree Projects/
ls
tree Sources/
cd ..
ls
cd 
ls
cd kdenlive-renderqueue/
ls
ls -a
cd ..
rm kdenlive-renderqueue/
rmdir kdenlive-renderqueue/
localssh 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
cd 
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
py
htop
cdf
ls
ls 
ls
htop
localssh 
cd
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
ls
ping google.es
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
htop
cdf
ls
melt part2_project_script.mlt 
ls
cd ..
ls
cd Finals/
ls
vlc part2_project.mp4 
htop
jobs
psfind
findps
findps *
ls
htop
gotop
localssh 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
ls
cdf
cd ..
ls
cd Finals/
ds part2_project.mp4 
vlc part2_project.mp4 
localssh 
ls
vlc part1_project.mp4 
vlc SnippetsOfCode01_part1.mp4 
diff part1_project.mp4 SnippetsOfCode01_part1.mp4 
diff part1_project.mp4 part2_project.mp4 
rm part1_project.mp4 
ls
file part2_project.mp4 
mime part2_project.mp4 
mimetype part2_project.mp4 
man mimeopen
mimeopen part2_project.mp4 
ls
rm part2_project.mp4 
localssh 
ping google.es
localssh 
cdf
cd
cdf
ls
vlc part2_project.mp4 
ls
rm part1_project.mp4 
cd
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
cdf
ls
rm part2_project.mp4 
cd
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
ls
ls kdenlive-renderqueue/
cdf
ls
cp ~/kdenlive-renderqueue/part3_project_script.mlt .
ls
cd
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
localssh 
htop
findps melt
findps
findps melt
localssh 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
cdf
ls
cdf
ls
vlc part2_project.mp4 
rm part2_project.mp4 
ls
vlc part3_project.mp4 
rm part3_project.mp4 
man nohup
cdf
localssh 
localssh 
localssh
localssh 
ls
cd titles
ls
cd ..
ls
ls kdenlive-renderqueue/
ls -a kdenlive-renderqueue/
ls
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
rsync -zaP titles/ sergio@$LOCALIP:~
localssh 
find /home/sergio/ -name *Aclaración*
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
cdf
ls
cd
cdf
ls
vlc part2_project.mp4 
vlc part3_project.mp4 
localssh 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
cdf
ls
cd
cdf
ls
vlc part2_project.mp4 
gpush
localssh 
updateGit
cdf
ls
nv
update
htop
man kdenlive-renderqueue/
man kdenlive_render/
info kdenlive_render
gpush
pandoc Libro.md -o Libro.epub --css styles.css --table-of-contents
ls
kindlegen Libro.epub 
ls
gpush
lsblk
rsync -zaP ~/LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
ls
melt part3_cut_project_script.mlt 
sudo pacman -S nautilus
nv
localssh 
cdf
ls
scp Libro.* sergio@$LOCALIP:~
pandoc Libro.md -o Libro.epub --css styles.css --table-of-contents
cdf
nv
ls
scp Historia\ de\ la\ locura\ -\ Sergio\ Quijano\ Rey.mobi sergio@$LOCALIP:~
localssh 
sudo kdenlive
findps kdenlive
touch "Diario 2020 02 - Febrero.md"
gpush
ºcdf
cdf
ls
nv
nv .bash_profi
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
remotessh 
localssh 
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
htop
local
localssh 
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
cd
rsync -zaP --delete --dry-run LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/ | nv -
rsync -zaP --delete --dry-run LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/ 
rsync -zaP --delete LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/ 
localssh 
cdf
ls
rm -rf DGIIM3/
updateGit
update
gpush
cdf
ls
nv
gpush
cdf
ls
nv
lsblk
cdf
ls
ds Fotografias/
cdf
ls
ds Video/
localssh 

rsync -zaP --delete --dry-run LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
rsync -zaP --delete --dry-run sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
rsync -zaP --delete --dry-run LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
rsync -zaP --delete LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
lsblk
ls /media/
sudo mount /dev/sdb1 /media/USB/
ls
cd
ls
rsync -zaP LinuxCloud/ /media/USB/LinuxCloud/
rsync -zaP --dry-run /media/USB/LinuxCloud/ LinuxCloud/ | nv -
rsync -zaP --dry-run /media/USB/LinuxCloud/ LinuxCloud/
rsync -zaP --delete --dry-run LinuxCloud/ /media/USB/LinuxCloud/ | nv -
rsync -zaP --delete --dry-run LinuxCloud/ /media/USB/LinuxCloud/

rsync -zaP --delete LinuxCloud/ /media/USB/LinuxCloud/
lsblk
sudo umount /media/USB/
lsblk
ds LinuxCloud/
ds *
cd
rsync -zaP --delete --dry-run LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
rsync -zaP --delete LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
nv pasos.md
ls
rm pasos.md 
cdf
ls
nv Bash\ cheatsheet.md 
gpush
localssh 
localssh 
ds LinuxCloud/Fotografias/
lsblk
sudo mount /dev/sdb1 /media/USB/
lsblk -f
cp .games/Minecraft/Launcher.jar /media/USB/Launcher.jar
sudo cp .games/Minecraft/Launcher.jar /media/USB/Launcher.jar
ranger
sudo nvim /etc/X11/xorg.conf.d/30-touchpad.conf 
confi3 
cdf
ls
cat touchpad.conf 
cd .
cd ..
ls
cd installation_files/
ls
less setup.sh 
ls
nv other.sh 
nv
nv ../config_files/touchpad.conf 
