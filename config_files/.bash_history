sudo umount /media/USB/
rmdir /media/CDROM/
sudo rmdir /media/CDROM/
ls /media/
lsblk
sudo mount /dev/sdb1 /media/USB/
lsblk
cdf
ls
rm drive-download-20190718T194746Z-001.zip 
ls
mkdir "Fotografías Viaje Córdoba 2019"
rsync -zaP /media/USB/DCIM/101MSDCF/ "Fotografías Viaje Córdoba 2019"
sudo umount /media/USB/
lsblk
sudo mount /dev/sdb1 /media/USB/
ls
rsync -zaP LinuxCloud/ /media/USB/LinuxCloud/
rsync -zaP /media/USB/LinuxCloud/ LinuxCloud/
rsync -zaP --delete --dry-run LinuxCloud/ /media/USB/LinuxCloud/ | nv
rsync -zaP --delete LinuxCloud/ /media/USB/LinuxCloud/
ls
rsync -zaP --delete LinuxCloud/ /media/USB/LinuxCloud/
rsync -zaP /media/USB/LinuxCloud/ LinuxCloud/
rsync -zaP --delete LinuxCloud/ /media/USB/LinuxCloud/
rsync -zaP /media/USB/LinuxCloud/ LinuxCloud/
ranger
sudo umount /media/USB/
lsblk
man hier
update
updateGit
nvf
update
sudo pacman -Rns google-chrome
sudo pacman -Ss brave
sudo pacman -S brave
update
unzip Seminario\ 1.\ Introducción\ a\ la\ programación\ mutihebra\ usando\ semáforos-20190913.zip 
extract scd-s1-fuentes.zip 
unzip Tema\ 1.\ Introducción\ a\ la\ Programación\ Concurrente-20190913.zip 
tcpdump
pacman -S tcpdump
sudo pacman -S tcpdump
pacman -Ss wireshark
sudo pacman -S wireshark
sudo pacman -S wireshark-*
sudo pacman -S wireshark-cli wireshark-qt
wireshark 
wireshark-cli
tcpdump 
sudo tcpdump 
mysql
sudo pacman -S mysql sqlite
mysql
sqlite3 
updateGit
nv .bash_aliases 
nvf
nv bin/backup-linuxcloud 
feh .
feh . --scale-down --auto-zoom
shotwell .
shotwell ./*
man shotwell
sudo pacman -Rns shotwell
sudo pacman -S ristretto
ristretto .
alias
unterminal 
mkdir Instagram
ristretto .
gimp
gimp .
nfv
nvf
updateDotfiles 
nv .bash_aliases 
updateDotfiles 
cdf
cp DSC01488.JPG ~/Instagram/
ls
cd
cdf
cp DSC01488.JPG ~/Instagram/
cp DSC01671.JPG ~/Instagram/
cp z.JPG ~/Instagram/
mv z.JPG DSC01671.JPG
cp DSC01978.JPG ~/Instagram/
sudo pacman -S mirage
sudo pacman -Ss mirage
yay -Ss mirage
ranger
updateGit
update
cd GitProjects/
git clone git@github.com:DGIIMUnderground/DGIIM3.git
ls
cd DGIIM3/
tree
nvf
cd 
ls
htop
ls
gpush
nvf deudas_nata.csv
nv deudas_nata.csv
ls
cat deudas_nata.csv 
rm deudas_nata.csv 
ls
cat ALSA_NATALIA.csv 
ds
du -h
du *
du -h *
gpush
ls
nv
nvf
cdf
ls
nv
updateGit
cdf
cd GitProjects/DGIIM3/
ls
glog
ls
nv .gitignore 
update
ls
updateDotfiles 
ls
htop
top
echo $LOCALIP
nv
source .bash_profile 
localssh 
ssh sergio@192.168.1.7
ls
rsync Manjaro-ARM-minimal.img sergio@192.168.1.7:~/minimal.iso
echo $LOCALIP
localssh 
localssh 
ssh sergio@sergioquijano.duckdns.org
localssh 
ssh sergio@sergioquijano.duckdns.org
nv .ssh/known_hosts 
ssh sergio@sergioquijano.duckdns.org
localssh 
localssh 
sudo pacman -Rns gnome-boxes
ls
ds
du
ds -h -d0
cd ..
ds sergio/
cd 
ranger
ls
ds LinuxCloud/
gpush
localssh 
rsync -zaP LinuxCloud/ sergio@$REMOTEIP:~/LinuxCloud/
gpush
cdf
ls
git pull
nv
py pruebas.py 
ls
file pruebas.
file pruebas.db
py pruebas.py 
file pruebas.db
py pruebas.py
file pruebas.py
file pruebas.db
cat pruebas.db
nv pruebas.db
nv pruebas.py
rm pruebas.db
pacman -Qi poppler
poppler
pacman -Qi atool
pacman -S atool
sudo pacman -S atool
sudo pacman -S libcaca
ranger
sudo pacman -S hightlight
sudo pacman -S highlight
ranger
rsync -zaP LinuxCloud/ sergio@$REMOTEIP:~/LinuxCloud/
unterminal 
localssh 
update
updateGit
nv .bash_profile 
localssh 
remotessh 
nv .i3/config 
updateDotfiles 
localssh 
remotessh 
ssh sergio@192.168.1.9
ssh sergio@192.168.1.8
remotessh 
ssh sergio@192.168.1.8
ls
lsblk
lsblk -f
sync
man sync
ranger
lsblk
cdf
sudo dd if="Manjaro-ARM-minimal-rpi4-19.08.img" of="/dev/sdb1" bs=4M status=progress
extract Manjaro-ARM-minimal-rpi4-19.08.img.xz 
extract ubuntu-18.04.3-preinstalled-server-arm64+raspi3.img.xz 
watch lsblk
lsblk
ls
cdf
ls
sudo dd if="Manjaro-ARM-minimal.img" of="/dev/sdb" bs=4M status=progress
watch lsblk
sudo gnome-disks
pacman -Ss noobs
yay -Ss noobs
lsblk
parted /dev/sdb
sudo parted /dev/sdb
ls
lsblk
lsblk -f
sudo mkfs.fat /dev/sdb1 
lslbk
lsblk -f
ls
unzip NOOBS_lite_v3_2.zip 
ls
mkdir NOOBS
mv * NOOBS
mv *.dtb NOOBS/
ls
cd NOOBS/
ls
mv *.img ../
ls
mv *.iso ../
rm *.zip
ls
ls os
cd ..
ls
mv recovery* NOOBS/
ls
lsblk
sudo dd if="ubuntu-raspberry.img" of="/dev/sdb" bs=32M status=progress
cd
ssh 192.168.1.9 
ssh ubuntu@192.168.1.9 
ssh root@192.168.1.9 
ssh ubuntu@192.168.1.9 
nmap
pacman -S nmap
sudo 1!
sudo sudo 1!
sudo pacman -S nmap
nmap
nmap -v -sn 192.168.1.0
nmap -v -sn 192.168.0.0
ssh ubuntu@192.168.1.9 
ssh sergio@192.168.1.9 
ssh ubuntu@192.168.1.9 
ssh sergio@192.168.1.9 
nvf
update
updateGit
nv .bash_profile
source .bash_profile
ssh sergio@$RASPIP
update
updateGit
ssh sergio@$RASPIP
source .bash_profile 
ssh sergio@$RASPIP
gpush
extract Manjaro-ARM-minimal-rpi4-19.08.img.xz 
gpush
cdf
ls
nv 
ranger
updateGit
update
gpush
cdf
nv
nv candidatos.txt
cd GitProjects/Universidad/
ls
nv .gitignore 
git add .
git commit
unzip captura.zip 
file FR
file FR.ova
cat FR.ova
chmod u+x bin/*
fastman service
cat candidatos.txt 
curl cheat.sh/service
ls /etc/init.d
ls /etc/init.d
curl cheat.sh/systemctl
nv .bash_aliases 
nv bin/fastman
service
man service
pacman -Ss service
pdftex
update
updateDotfiles 
updateGit
gpush
cdf
git pull
nv
ds Virtual\ Machines/
cat candidatos.txt 
ranger
rm candidatos.txt 
ls
cat pruebas.py 
rm pruebas.py 
ls
rm -r Instagram*
ls
ls -a
gpush
cdf 
ls
nv 
ls
git pull
nv
ranger
updateGit
update
mysql
man mysql
mariadb
man mariadb
cdf
ls
nv AP
nv Apuntes\ de\ clase.md 
gpush
ranger
py pruebas.py 
p
py
l
ls
pacman -Qi vala
nv pruebas.py
update
nvf
pacgraph
sudo pacman -S pacgraph
pacgraph
ls
feh pacgraph.png 
nvf
cdf
cd ~/bin
ls
nv .config/nvim/init.vim 
docker run ubuntu:bash
sudo pacman -S docker
docker run ubuntu:bash
systemctl enable dockerd
gpush
cdf
ls
gpush
nvf
pacman -Ss virtualbox
updateGit
update
sync
pacman -Ss virt-manager
pacman -S community/virt-manager
sudo pacman -S community/virt-manager
nvf
sudo pacman -Rns virt-manager
sims
ranger
cdf
ls
gpush
cd ..
ls
gpush
cmatrix
nvf
ranger
unzip scd-s1-fuentes.zip 
g++ ejemplo01.cpp -o ejemplo1 
g++ ejemplo01.cpp -o ejemplo1 -std=c++11 
g++ ejemplo01.cpp -o ejemplo1 -std=c++11 -lpthread
./ejemplo1 
val ejemplo1
val ./ejemplo1
compile
nv .bash_aliases 
pacman -Ss jed
jed
cd 
ls
compile pruebas.cpp -o pruebas
val ./pruebas
rm ~/pruebas
rm ~/pruebas.cpp
ls #
ls ~
rm ~/manu.db 
ls
ls ~
rm ~/pacgraph.*
ls ~
cd ~
nvf
source ~/.bash_aliases 
alias
compile ejemplo02.cpp -o ejemplo1 && ./ejemplo1
compile ejemplo02.cpp -o ejemplo1 && ./ejemplo1 | less
rm ejemplo1
ls
compile ejemplo03.cpp -o ejemplo && ./ejemplo
nv pruebas.cpp
gpush
nv Apuntes\ de\ clase.md 
compile actividad_pi.cpp -o actividad && val ./actividad
gcommit
compile actividad_pi.cpp -o actividad && val ./actividad
nv
nvconf 
updateDotfiles 
gpush
cd ..
ds misArchivos/
cdf
ls
git pull
nv
ls
compile actividad_pi.cpp -o actividad && val ./actividad
compile clean.cpp -o clean && val ./clean
py
compile clean.cpp -o clean && val ./clean
compile clean.cpp -o clean && ./clean
free
free -h
rm clean actividad
ls
gcommit
gotop
ls
compile actividad_pi.cpp -o actividad && val ./actividad
compile actividad_pi.cpp -o actividad && ./actividad
gcommit
git status
gpush
compile actividad_pi.cpp -o actividad && ./actividad
gcommit
glog
compile actividad_pi.cpp -o actividad && ./actividad
gcommit
rm clean.cpp 
ls
compile actividad_pi.cpp -o actividad
compile actividad_pi.cpp -o actividad && ./actividad
gotop
pacman -Ss gnome | grep monitor
sudo pacman -S extra/gnome-system-monitor
./actividad 
gpush
ls
pandoc Memoria.md -o Memoria.pdf
nv .bash_alias
nv .bash_aliases 
less Memoria.
less Memoria.pdf
pdftotext Memoria.pdf | less
pdftotext Memoria.
pdftotext Memoria.pdf
pandoc Memoria.md -o Memoria.pdf
ls
nv Memoria.md 
ls
rm *.tex *.txt
ls
rm Memoria.pdf 
gpush
nv *.cpp
remotessh 
yay -S google-chrome
ranger
update
uptime
neofetch 
updateGit
find . -name vgcore*
find /home/sergio/ -name *vgcore*
find /home/sergio/ -name *vgcore.*
find /home/sergio/GitProjects/ -name *vgcore.*
find /home/sergio/GitProjects/ -name vgcore.*
gcommit
compile ejemplo09.cpp -o ejemplo && ./ejemplo
rm ejemplo
evince Memoria.pdf &
unterminal 
pandoc Memoria.md -o Memoria.tex
ls
rm Memoria.{log,tex}
ls
nv
nv 
ls
xprop
sudo pacman -Rns qpdfview
cdf
ls
nv Ranger\ cheatsheet.md 
remotessh 
localssh 
ds LinuxCloud/Virtual\ Machines/
htop
gotop
remotessh 
nv
lsblk
lsblk -f
ls
nv Tema\ 1.md 
cdf
ls
ds FR
ds FR*
sudo xfce4-settings
sudo xfce4-settings-manager 
sudo xfce4-settings-manager
xfce4-settings-manager
gpush
cd
nv
pacman -Ss emule
yay -Ss emule
pacman -Ss virtualbox
uname -a
remotessh 
rsync LinuxCloud/ sergio@$REMOTEIP:~/LinuxCloud/
rsync -zaP LinuxCloud/ sergio@$REMOTEIP:~/LinuxCloud/
gotop
route -n
sudo pacman -S net-tools
route -n
ping google.es
remotessh 
sudo wireshark
nc
pacman -S nc
sudo pacman -S nc
nv Apuntes\ de\ prácticas.md 
update
updateGit
curl ifconfig.me
ifconfig
gpush
cdf
nv
nvf
ls
mkdir Imagenes
gcommit
git push
nv Apuntes\ de\ prácticas.md 
ls
cd GitProjects/
ls
cd ~/LinuxCloud/
ls
cd Games
ls
cd SheikahServer/
ls
ls -l
tree Hyrule/
tree logs
cd ..
ls
cd SheikahServer/
rsync -zaP . sergio@$LOCALIP:~/Minecraft
ls
cd
ls
rsync server.jar sergio@$LOCALIP:~/Minecraft_Server/server.jar
nv bin/launcher 
ls .games
ls
nv bin/launcher 
nv .bash_profile 
lsblk
sudo mount /dev/sdb1 /media/USB/
rsync -zaP --dry-run /media/USB/LinuxCloud/ LinuxCloud/
rsync -zaP --dry-run /media/USB/LinuxCloud/ LinuxCloud/ | less
rsync -zaP /media/USB/LinuxCloud/ LinuxCloud/ 
man rsync
rsync -zaP LinuxCloud/ /media/USB/LinuxCloud/
rsync -zaP /media/USB/LinuxCloud/ LinuxCloud/
sudo rsync -zaP /media/USB/LinuxCloud/ LinuxCloud/
sudo umount /media/USB/
sync
sudo umount /media/USB/
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/ --dry-run | less
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
sudo rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
localssh 
localssh 
sudo umount /media/USB
sudo umount -f //media/USB
sudo umount -f /media/USB
man umount
sudo umount --force /media/USB 
lsblk
sudo mount /dev/sdc1 /media/USB 
sudo umount /media/USB 
sudo mount /dev/sdc1 /media/USB 
sudo gnome-disks
localssh 
ls
scp server.jar sergio@$LOCALIP:~/Minecraft_Server/server.jar
nv .bash_functions 
findps termite
nv .bash_functions 
findps termite
nv .bash_functions 
findps termite
findps fi
findps firefox
man grep
nv .bash_functions 
findps firefox
localssh 
findps rsync
nv .bash_functions 
findps rsync
updateDotfiles
rsync -zaP sergio@$LOCALIP:~/LinuxCloud/ LinuxCloud/
rsync -zaP LinuxCloud/ sergio@$LOCALIP:~/LinuxCloud/
localssh 
sudo shutdown -h now
localssh 
man groupmod
man groudadd
man addgroup
curl cheat.sh/groupmod
curl cheat.sh/groupade
curl cheat.sh/groupadd
curl cheat.sh/chmod
localssh 
nvf
fastman adduser
man adduser
man useradd
updateGit
ls
update
gpush
cdf
git pull
nv
update
updateGit
cd GitProjects/
ls
clone git@gitlab.com:SergioQuijano/ApuntesUniversidad
git clone git@gitlab.com:SergioQuijano/ApuntesUniversidad
ls
cd ApuntesUniversidad/
ls
ls -a
nv README.md
gpush
glog
git log --one-line
git log -one-line
git log --oneline
cdf
ls
gpush
tree
open
xdg-open 2º\ Curso/1º\ Cuatrimestre/Analisis\ II.pdf 
nv ~/bin/open
less ~/.bash_functions 
nv ~/bin/open
gpush
cdf
ls
gpush
updateGit
update
gpush
cd ../2º\ Cuatrimestre/
ls
gpuhs
gpush
nv
tmp
temp
update
updateGit
gotop
ls
nv pruebas.txt
gpush
v Tema\ 1.md 
ls
rm Scre_2019-09-25_16-59-11.png 
s
ls
gcommit
gpush
rm *.pdf
gpush
nv
curl ifconfig.me
curl ifconfig.me/all
gpush
updateGit
g++ -I. ejemplo13-s.cpp Semaphore.cpp -lpthread -o pruebas
val ./pruebas 
./pruebas 
./pruebas | less
nv
ls
nv Especificacion Tarea.md
nv "Especificacion Tarea.md"
update
updateGit
pacman -Ss ace of spades
yay -Ss ace of spades
update
gpush
cdf
git pull
nv
uname .a
uname -a
sudo pacman -S linux52
yay -S openspades
xtra/linux52-virtualbox-guest-modules 6.0.10-13 (linux52-extramodules)
extra/linux52-virtualbox-host-modules 6.0.10-13 (linux52-extramodules)
sudo pacman -S linux52-virtualbox-guest-modules 
sudo pacman -S linux52-virtualbox-host-modules 
uname -a
pacman -Ss virtualbox
pacman -Ss linux52*virtualbox
pacman -Ss linux52virtualbox
pacman -Ss linux52
pacman -Ss virtualbox | nv
sudo /sbin/vboxconfig
sudo /bin/vboxconfig
vboxconfig
sudo vboxreload
yay -S openspades
ls
pacman -Ss virtualbox
ping google.es
nv Tema\ 1.md 
gpush
nv pruebas.md
nv bin/prevmark
chmod u+x bin/*
prevmark pruebas.md 
ls
rm pruebas.md 
ls
yay -Ss paint
yay -Ss tuxpaint
sudo pacman -S gnu-paint
sudo pacman -S gnupaint
sudo pacman -Ss gnupaint
sudo pacman -Ss paint
sudo pacman -S krita
sudo pacman -Rns krita
brave Apuntes\ de\ prácticas.md &
unterm
unterminal 
nv Apuntes\ de\ prácticas.md 
nv
prevmark Apuntes\ de\ prácticas.md 
updateGit
s
ls
cat ALSA_NATALIA.csv 
sha256sum ALSA_NATALIA.csv 
file ALSA_NATALIA.csv 
mv ALSA_NATALIA.pdf
mv ALSA_NATALIA.csv ALSA_NATALIA.pdf
file ALSA_NATALIA.pdf 
mv ALSA_NATALIA.pdf ALSA_NATALIA.csv
gpush
v
pacman -Ss zathura
sudo pacman -S zathura
update
updateGit
localssh 
localssh 
ifconfig
localssh 
update
updateGit
cdf
nv
gpush
cd ..
ds misArchivos/
gpush
gpush 
cdf
nv
py
extract Practica1
extract Practica1-fuentes.zip 
cd
cd GitProjects/Universidad/
gpush
nv
gcommit
localssh 
localssh 
findps minecraft
sudo kill -9 27982
htop
updateGit
nvf
update
lsblk
update
lsblk
lsblk -f
cd Downloads/
ls
ranger
make pc
ls
val productorconsumidor_exe 
val ./productorconsumidor_exe 
ls
make pc
ls
rm productorconsumidor
rm productorconsumidor_exe 
make val_productorconsumidor
gcommit
gpush
nv
sudo nemo
lsblk
sudo gnome-disks
lsblk
sudo gnome-disks
make val_productorconsumidor
cdf
ls
cd Mi\ código/
ls
ranger
update
updateGit
make val_productorconsumidor
compile clean.cpp -o clean
val ./clean
gcommit
rm vgcore.10515 
gcommit
compile clean.cpp -o clean 
val ./clean
echo $?
./clean 
echo $?
compile clean.cpp -o clean 
val ./clean
compile clean.cpp -o clean && val ./clean
gcommit
compile -I./ Semaphore.cpp clean.cpp -o clean && val ./clean
gcommit
compile -I./ Semaphore.cpp clean.cpp -o clean && val ./clean
glog
compile -I./ Semaphore.cpp clean.cpp -o clean && val ./clean
gcommit
git push origin master
gcommit
gpush
compile -I./ productorconsumidor.cpp Semaphore.cpp -o productorconsumidor && val ./productorconsumidor
ls
htop
gotop
compile -I./ productorconsumidor.cpp Semaphore.cpp -o productorconsumidor && ./productorconsumidor
compile -I./ clean.cpp Semaphore.cpp -o clean && val ./clean
compile -I./ productorconsumidor.cpp Semaphore.cpp -o productorconsumidor && val ./productorconsumidor
gcommit
compile -I./ productorconsumidor.cpp Semaphore.cpp -o productorconsumidor && val ./productorconsumidor
gpush
ls
rm clean productorconsumidor
ls
gpush
nv
ls
nv productorconsumidor.cpp
nv
htop
nvconf 
gpush
ds .git/
ds 2º\ Curso/
ds
ds *
ds *.*
ds *
for file in ls -al ; do ds $file ; dole
for file in ls -al ; do ds $file ; done
for file in $(ls -a) ; do ds $file ; done
for file in $(ls -a) ; do ds "$file" ; done
ls
ds .git/
ds 2º\ Curso/
updateDotfiles
nvf
update
updateGit
fuse
pacman -Ss fues
pacman -Ss fuse
gcommit
ls
htop
gpush
nv
pacman -Ss named
pacman -Ss name
pacman -Ss name | grep dns
yay -Ss named
yay -Ss named | grep dns
whois google.com
whois
pacman -S whois
sudo pacman -S whois
whois google.es
whois google.com
man whois
ipaddr google.es
man 2 gethostbyname
man gethostbyname
hostnme
hostname

hostnme -d
hostnme -D
hostname -D
hostname -d
sudo nvim /etc/resolv.conf 
pacman -Ss mdless
pacman -S mdless
sudo pacman -S mdless
yay -Ss mdless
yay -S mdless
yay -S ruby-mdless
mdless
mdless Tema\ 2.md 
cdf
mdless Tema\ 2.md 
sudo pacman -Rns mdless
sudo pacman -Rns ruby-mdless
pacman -Ss mdp
pacman -S mdp
sudo pacman -S mdp
ls
mdp Tema\ 2
mdp Tema\ 2.md 
sudo pacman -Rns mdp
pacman -Ss mad
yay -Ss mad
yay -Ss mad | nv
pacman -Ss mdr
mdv Tema\ 2
mdv Tema\ 2.md 
pacman -Ss mdv
yay -Ss mdv
yay -S aur/python-mdv-git
mdv
mdv "Tema 2
cdf
mdv Tema\ 2.md 
mdv Tema\ 2.md | less
mdv Tema\ 2.md | more
mdv
mdv Tema\ 2.md 
yay -Rns aur/python-mdv-git
sudo pacman -Rns python-mdv-git
pacman -Q 
pacman -Q | grep m*
pacman -Q | grep m
pacman -Q | grep m+
pacman -Q | grep m*
sudo wireshark &
unterminal 
findps wireshark
htop
sudo wireshark
unterminal 
ls /usr/doc/
sudo ls /usr/doc/
nslookup
sudo pacman -S nslookup
pacman -Ss network tools
net-tools
nslookup
pacman -Ss nslookup
yay -Ss nslookup
resolver
man resolver
gotop
gpush
nvf
ls
mv clean_productorconsumidor.cpp onelifo.cpp
gcommit
git push
ls
mv onelifo.cpp clean_onelifo.cpp
mv productorconsumidor.cpp onelifo.cpp
gcommit
ls
compile onefifo.cpp Semaphore.cpp -o onefifo && val ./onefifo
git status
ls
rm clean_onelifo.cpp 
ls
mv fumadores-plantilla.cpp onefumadores.cpp
ls
rm onefifo
gcommit
git push
ls
cp onefifo.cpp morefifo.cpp
cp onelifo.cpp morelifo.cpp
gcommit
ls
cp onefumadores.cpp morefumadores.cpp
gcommit
nv
fzf
cdf
cd
ls
nv
ls
ls -a
nv .dir_colors 
ls
ls -a
cdf
ls
brave Tema\ 2.md &
ls
pandoc "Tema 2.md" -o "Tema 2.tex" 
pandoc "Tema 2.md" -o "Tema 2.pdf" 
ls
less *.tex
ls
nv pruebas.md
nv
nv
update
gpush
cdf
git pull
nv
updateGit
gcommit
gcommit -m "Añado mensajes mas apropiados para morelifo.cpp"
ls
compile morelifo.cpp Semaphore.cpp -o morelifo && val ./morelifo
gcommit
git push
ls
./morelifo 
ls
rm morelifo
compile onefifo.cpp Semaphore.cpp -o onefifo
val ./onefifo
gcommiut
gcommit
ls
ñsa
ls
rm onefifo
compile morefifo.cpp Semaphore.cpp -o morefifo && val ./morefifo
rm morefifo
ls
gcommit
git push
gcommit
glog
findps
findps spotify
sudo kill -9 7472
gcommit
ls
compile onefumadores.cpp Semaphore.cpp -o fumadores && val ./fumadores
compile -g onefumadores.cpp Semaphore.cpp -o fumadores && val ./fumadores
gcommit
rm vgcore.*
gcommit
rm vgcore.*
compile -g onefumadores.cpp Semaphore.cpp -o fumadores && val ./fumadores
rm onefumadores.cpp 
ls
cat onefumadores.cpp 
ls
rm fumadores 
gcommit
git push
cat onefumadores.cpp > morefumadores.cpp 
gcommit
ls
compile morefumadores.cpp Semaphore.cpp -o morefumadores && val ./morefumadores
gcommit
nv
ranger
ristretto . &
unterminal 
ristretto 
ristretto &
unterminal
ristretto . &
nvf
ping google.es
update
updateGit
rm pruebas.md 
invertcsv Movimientos.csv intercambio.csv
man modprobe
gpush
git log
glog
nvconf 
zip -r practicas.zip .
ls
htop
dunst
pacman -Ss dunst
nv
update
nvconf 
nv apuntesclase.md
fastman ifconfig
ifconfig
update
updateGit
ls
rm intercambio.csv Movimientos.csv practicas.zip 
ls
rm -r Fotos\ Nata/
ls
ls Cuentas\ Granada/
ls
ls Cuentas\ Granada/
rm -r Cuentas\ Granada/
ls
pacman -Ss calendar
pacman -Ss calendar | grep google
yay -Ss calendar | grep google
updateGit
update
gpush
cdf
nv
gpush
ls
fastman emacs
fastman vim
update
updateGit
update
gpush
cdf
nv
updateGit
updateDotfiles
nvconf 
update
updateGit
gpush
nv
ping google.es

rm *.tex
nv
update
updateGit
gpush
htop
cdf
nv
update
gpush
ssh localhost
ssh localhost -p 25
man ssh
updateGit
cdf
nv
cdf
nv
ls
nv
vi
ls
nvim
nv
bash
update
gpush
nv
vim
cdf
vi
vim
neovim
nvim
htop
gotop
pacman -S ftp
sudo pacman -S ftp
systemctl status xinetd
sudo systemctl status xinetd
ls /etc/ | grep inet
cd /etc/xinetd.d/
ls
nv rsync 
nv telnet
pacman -Qi xinetd
man vsftpd.conf
man vsftpd
man telnetd.conf
man telnet.conf
man telnet
man man
man 5 rsync 
man 5 sshd
man 5 ssh
man 5 openssh
man ftp
info ftp
man xinetd
pacman -Qi xinetd
sudo shutdown -h now
nv
ls
cd
cd GitProjects/
git clone git@github.com:SergioQuijanoRey/TrabajoFundamentosRedes.git
cd TrabajoFundamentosRedes/
ls
git add README.md 
git commit
git push
gpush
ls
cd Documento/
make
cd Documento/
make
cd Documento/
make
cd Documento/
ls
make pdf
ls
evince Trabajo.pdf &
make pdf
cd Documento/
make pdf
cd Documento/
make pdf
pdflatex Trabajo.
cd Documento/
make pdf
evince Trabajo.pdf (
evince Trabajo.pdf &
cd Documento/
ls
make deepclean
ls
make pdf
ls
less Trabajo.pdf
more Trabajo.pdf
man less
pdfless
pacman -Ss pdfless
pacman -Ss pdf less
ls
make deepclean
ls
gpush
ls
nv 
gpush
nv pruebas.txt
nv pruebas.md
nv
cd
nv .config/nvim/init.vim 
updateDotfiles 
ls
!
ping google.es
man alacritty
man termite
termite -c .config/termite/config 
cdf
ls
git pull
git log
gpush
nv
pdftotex
pdftotext
pdftoppm
man pdftoppm
ls ~/.cache/ranger
w3mimgdisplay
pacman -Ss $>r
pacman -Ss $>
pacman -Ss w3mimgdisplay
pacman -Ss w3m
sudo pacman -S extra/w3m
nvf
alacritty
ranger
sudo pacman -S urxvt
sudo pacman -Ss urxvt
sudo pacman -S rxvt-unicode 9.22-9
community/rxvt-unicode-terminfo 9.22-9
community/urxvt-perls 2.2-2
sergio at asus-portatil in ~
$ sudo pacman -S 
$ sudo pacman -S rxvt-unicode
$ sudo pacman -S community/rxvt-unicode
sudo pacman -S community/rxvt-unicode
cdf
cd .config/ranger/
s
nv
git pull
gpush
cdf
ls
nv 
gpush
cd
cd GitProjects/Y
cd GitProjects/Universidad/
gpush
findps urxvt
findps discord
sudo kill -9 1724
updateGit
update
fastman ufw
cdf
gpuhs
gpush
nvf
update
updateGit
cdf
glog
ranger
update
updateGit
gpush
cdf
git pull
nv
cdf
gpush
updateGit
update
updateGit
gpush
cdf
ls
nv
unzip ExamenSCD.zip 
cd
cd GitProjects/Universidad/
gpush
compile onefumadores.cpp Semaphore.cpp -o onefumadores && val ./onefumadores
gcommit
rm onefumadores
compile morefumadores.cpp Semaphore.cpp -o exe && val ./exe
ls
rm exe 
ls
gcommit
ls
compile onelifo.cpp Semaphore.cpp -o exe 
val ./exe 
file exe
./exe
ls
compile morelifo.cpp Semaphore.cpp -o exe
val ./exe
./exe 
compile morelifo.cpp Semaphore.cpp -o exe
./exe 
compile morefifo.cpp Semaphore.cpp -o exe
val ./exe
./exe
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
compile morelifo.cpp Semaphore.cpp -o exe && val ./exe
gpush
gcommit
git push
compile morelifo.cpp Semaphore.cpp -o exe && val ./exe
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
gotop
htop
ls
less fallos.log 
compile onefifo.cpp Semaphore.cpp -o exe && val ./exe
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
compile morelifo.cpp Semaphore.cpp -o exe && val ./exe
compile onelifo.cpp Semaphore.cpp -o exe && val ./exe
./exe
compile onefifo.cpp Semaphore.cpp -o exe && val ./exe
./exe
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
gcommit
git push
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
for i in {0..200}; do ./exe 1> /dev/null 2>> fallos.log; done
ls
cat fallos.log 
rm fallos.log 
less fallos.log 
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
for i in {0..50}; do echo "Ejecucion $i"
for i in {0..50}; do echo "Ejecucion $i" >> fallos.log; ./exe 1> /dev/null 2>> fallos.log; done
rm fallos.log 
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
py
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
py
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
gcommit
git push
compile morefifo.cpp Semaphore.cpp -o exe && val ./exe
compile morelifo.cpp Semaphore.cpp -o exe && val ./exe
gpush
compile onefumadores.cpp Semaphore.cpp -o exe && val ./exe
cat onefumadores.cpp 
less onefumadores.cpp 
compile onefumadores.cpp Semaphore.cpp -o exe && val ./exe
gcommit
git push
cp morefumadores.cpp morefumadoresunicos.cpp
compile morefumadoresunicos.cpp Semaphore.cpp -o exe && val ./exe
gcommit
compile morefumadores.cpp Semaphore.cpp -o exe && val ./exe
for i in {0..100}; do ./exe; done
compile morefumadores.cpp Semaphore.cpp -o exe && val ./exe
for i in {0..100}; do ./exe; done
ls
compile morefumadores.cpp Semaphore.cpp -o exe && val ./exe
ls
compile mo
compile onefumadores.cpp Semaphore.cpp -o exe && val ./exe
./exe
for i in {0..9}; do ./exe; done
compile onefifo.cpp Semaphore.cpp -o exe
val ./exe
./exe
compile morefifo.cpp Semaphore.cpp -o exe
val ./exe
./exe
compile morefumadoresunicos.cpp Semaphore.cpp -o exe && val ./exe
for i in {0..14}; do ./exe; done
nv
cd
updateGit
cdf
ls
rm vgcore.*
ls
cds
cd
updateGit
gpush
cdf
ls
git pull
nv
update
gotop
gpush
nv
nv .i3/scripts/lockscreen 
nv
actualizarGit
nvim
vim
pandoc Tema\ 2.md -o "Tema 2.pdf"
ls
pandoc Tema\ 2.md -o "Tema 2.pdf"
ls
pandoc "Tema 2.md" -o "Tema 2.tex"
ls
pandoc "Tema 2.tex" -o "Tema 2.pdf"
ls
nv Tema\ 2.tex
n
nv
ls
zip -r version1.zip
zip -r version1.zip .
nv version1.zip 
cp version1.zip ~
mv version1.zip ~
ls
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
./exe
ls
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
zip -r version2_entregable.zip -
zip -r version2_entregable.zip .
mv version2_entregable.zip ~
ls
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
./exe
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
zip -r version3.zip .
mv version3.zip ~
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
ls
zip -r version4.zip . ; mv version4.zip ~
ls
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
zip -r version5.zip . ; mv version5.zip ~
compile estancos2.cpp Semaphore.cpp -o exe && val ./exe
zip -r version6.zip .
mv version6.zip ~
rm exe
ls
ls
nv
cd Examen/
ls
rm exe more*
ls
rm onefifo.cpp onelifo.cpp TODO.md 
ls
rm makefile 
ls
mv onefumadores.cpp estancos2.cpp
ls
compile estancos2.cpp Semaphore.cpp -o exe
./exe
lsblk
cat ~/Apuntes\ de\ clase.md >> Apuntes\ de\ clase.md 
mkdir Archivos de Ejemplo
rmdir Archivos de Ejemplo
mkdir "Archivos de Ejemplo"
mv scd-s2-fuentes.zip Archivos\ de\ Ejemplo/
ls
cd Archivos\ de\ Ejemplo/
ls
unzip scd-s2-fuentes.zip 
rm *.zip
alias compile
pacman -Qi g++
man g++
cdf
ls
nv Apuntes\ de\ clase.md 
update
gotop
updateGit
gotop
gpush
nv
nv
choose_wallpaper 
choose_wallpaper -l
choose_wallpaper -c otoño1.jpg
updateDotfiles
choose_wallpaper -c otoño1.jpg
cdf
ls
git pull
nv *Oc*
update
updateGit
gpush
cdf
ls
nv
chmod u+x .i3/scripts/*
wallpaper
echo $ROFI_THEME
wallpaper
man rofi
wallpaper
ls 
wallpaper
~/backgrounds/
ls ~/backgrounds/
ls ~/backgrounds
wallpaper
rm .i3/scripts/choose_wallpaper 
wallpaper
wallpaper 
nv 
nv .i3/scripts/choose_wallpaper 
cat wallpaper.log 
rsync -zaP --delete . ~/backgrounds/
ls backgrounds/ | rofi 
ls backgrounds/ | rofi -show run
ls backgrounds/ | rofi -dmenu
wallpaper
nv .i3/scripts/wallpaper 
wallpaper 
nv .i3/scripts/wallpaper 
updateDotfiles
confi3
updateDotfiles
nv
nv .config/ranger/
openssl
man openssl
pacman -Ss lightdm-webkit-theme-litarvan
sudo pacman -S lightdm-webkit-theme-litarvan
sudo nvim /etc/lightdm/lightdm.conf
sudo nvim /etc/lightdm/lightdm-webkit.conf
rm pruebas.cpp 
nv
nv pruebas
rm pruebas*
ls
less Apuntes\ de\ clase.md 
confi3
sudo nvim 
sudo nvim /etc/lightdm/lightdm-webkit.conf
sudo rm /etc/lightdm/lightdm-webkit.conf
sudo nvim /etc/lightdm/lightdm.conf
systemctl status lightdm
sudo systemctl status lightdm
sudo systemctl restart lightdm
sudo pacman -Rns lightdm-webkit-theme-litarvan
lightdm
sudo lightdm
man lightdm
lightdm -c
lightdm -d
lightdm --test-mode
nv /etc/host.conf 
:q
pacman -Ss dnscheff
yay -Ss dnscheff
yay -Ss dns chef
yay -Ss dns cheff
nvim pruebas.py
nv
ls
pacman -Ss nextcloud
curl google.es
curl cheat.sh/ls
curl cheat.sh/curl
ls
nv Ideas\ para\ el\ trabajo.md 
nv
ls+
ls
nv Correo\ solicitud\ para\ el\ profesor.md 
updateGit
gpush
nv
gush
gpush
nv
nv
pacman -Ss tux-kart
pacman -Ss tux
sudo pacman -S community/supertuxkart
updateGit
openssl
OPENSSL
sha512sum .bashrc
ls
vi
ls
man enc
openssl enc -aes-128-cbc -in FR1.txt -out enFR1.txt
cat enFR1.txt 
openssl enc -d -aes-128-cbc -in enFR1.txt -out deenFR1.txt
ls
cat deenFR1.txt 
openssl enc -d -aes-128-cbc -in enFR1.txt -out deenFR1.txt
cat deenFR1.txt 
openssl enc -d -aes-128-cbc -in enFR1.txt -out deenFR1.txt
cat deenFR1.txt 
openssl enc -d -aes-128-cbc -in enFR1.txt -out deenFR1.txt
cat deenFR1.txt 
diff FR1.txt deenFR1.txt 
cmp FR1.txt deenFR1.txt 
nvim
vim
cd .ssh/
ls
cd ..
nv
openssl genpkey -algorithm RSA -out privkey
cat privkey 
openssl pkey -in privkey -pubout pubkey
ls
openssl pkey -in privkey -pubout -out pubkey
cat pubkey 
sudo clave.txt
nv clave.txt
openssl pkeyutl -pubin -enc -in clave.txt -out clave.enc -inkey pubkey 
openssl pkeyutl -pubin -encrypt -in clave.txt -out clave.enc -inkey pubkey 
ls
cat clave.enc
openssl pkeyutl -decrypt -in clave.enc -out clave.dec -inkey privkey 
cat clave.dec 
sha512sum .bashrc
sha512sum clave.
sha512sum clave.enc 
openssl dgst -sha256 -sign privkey -out FR1.dgst FR1.txt
openssl dgst -sha256 -verify pubkey -signature FR1.dgst FR1.txt 
sha256sum FR1.txt 
openssl dgst -sha256 -out FR1.dgst FR1.txt 
cat FR1.dgst 
openssl req -new -out csr
openssl req -text -verify -in csr
ls
cat privkey
cat privkey.pem
cat privkey.pem | wc -w
cat privkey.pem | wc -l
cat privkey.pem | wc -c
openssl req -in csr -noout -pubkey
req -in csr -noout -pubkey
openssl x509 -req -days 365 -in csr -signkey privkey -out crt
cat crt 
yay -S spotify
yay -S League of legends
yay -S League 
yay -Ss League of legends 
yay -Ss ms office
ranger
update
updateGit
gpush
nv
cdf
ls
nv *Oc*
nv
ls
rm Apuntes\ de\ clase.md 
nv
nvf
gpush
updateGit
update
gpush
cdf
ls
nv *Oc*
cd
cd GitProjects/TrabajoFundamentosRedes/
ls
cat Correo\ solicitud\ para\ el\ profesor.md 
compile monitor_em.cpp Semaphore.cpp HoareMonitor.cpp -o exe && val ./exe
./exe
compile monitor_em.cpp Semaphore.cpp HoareMonitor.cpp -o exe && val ./exe
ls
ls
less HoareMonitor.
less HoareMonitor.h 
ls
nv Semaphore.h 
nv monitor_em.cpp 
ls
cd ~
ls
compile pruebas.cpp -o exe && ./exe
cd ~
ls
compile -g pruebas.cpp -o exe && val ./exe
cd ~ ; compile -g pruebas.cpp -o exe && val ./exe 
:w
cd ~ ; compile -g pruebas.cpp -o exe && val ./exe 
gpush
bv
nv
updateGit
update
gpush
cdf
ls
nv 
ls
compile -g pruebas.cpp -o exe && val . 
compile -g pruebas.cpp -o exe && val ./exe
alias compile
compile -g pruebas.cpp -o exe 
val ./exe
compile -g pruebas.cpp -o exe 
val ./exe
compile -g pruebas.cpp -o exe 
val ./exe
compile -g pruebas.cpp -o exe && val ./exe
n
v
gpush
rm vgcore.*
gpush
cp prodcons1_sc.cpp productor_consumidor_varios_sc.cpp
gpush
make
ls
cat makefile 
rm makefile 
make
gcommit
git push
gpush
gcommit
gcommiyt
gcommit
ls
alias compile
make
make clean
ls
make
make varios_sc
g`
g++
make varios_sc
g++ -std=c++11 -lpthread -g productor_consumidor_varios_sc.cpp -o varios_sc
ls
make exe_varios_sc
valgrind
make exe_varios_sc
ls
val ./varios_sc 
ls
compile productor_consumidor_varios_sc.cpp -o varios_sc && val ./varios_sc 
ls
unzip Export-7b3ab3e3-2f7d-455d-b172-9310e5577937.zip 
compile productor_consumidor_varios_sc.cpp -o varios_sc && val ./varios_sc 
gcommit
git push
compile productor_consumidor_varios_sc.cpp -o varios_sc && val ./varios_sc 
doxygen
gpush
ls
rm pr
rm pruebas.cpp 
gcommit -m "Elimino el archivo de pruebas"
ls
cp productor_consumidor_varios_sc.cpp productor_consumidor_varios_su.cpp 
gcommit -m "Creo una primera version de la semantica SU copiando el codigo de SC"
ds Telegram\ Desktop/
pacman -Ss notion
yay -Ss notion
yay -S aur/notion-app
sudo pacman -Rns notion-app
ls
compile productor_consumidor_varios_su.cpp -o varios_su && val ./varios_su
compile productor_consumidor_varios_su.cpp HoareMonitor.cpp -o varios_su && val ./varios_su
compile productor_consumidor_varios_su.cpp HoareMonitor.cpp Semaphore.cpp -o varios_su && val ./varios_su
gcommit
compile productor_consumidor_varios_su.cpp HoareMonitor.cpp Semaphore.cpp -o varios_su && val ./varios_su
compile -g productor_consumidor_varios_su.cpp HoareMonitor.cpp Semaphore.cpp -o varios_su && val ./varios_su
cd Des
cd Downloads/
ls
ls -l scd-s2-fuentes.zip 
unzip scd-s2-fuentes.zip 
ls
gcommit
compile pruebas.cpp HoareMonitor.cpp Semaphore.cpp -o prueba && val ./prueba
compile productor_consumidor_varios_su.cpp HoareMonitor.cpp Semaphore.cpp -o prueba && val ./prueba
gpush
cdf
ls
nv Apuntes\ de\ clase.md 
gpush
rm vgcore.*
gpush
ls
l
ls
delete barrera*
rm barrera*
ls
rm exe 
rm monitor_em.cpp 
ls
rm prodcons1_sc.cpp 
ls
gpush
nv
updateGit
update
cdf
gpush
ls
unzip Ex
unzip Export-eeb97422-2e24-4f54-a7c6-fbb24d769a03.zip 
ls
rm Export-eeb97422-2e24-4f54-a7c6-fbb24d769a03.zip 
nv 22
ls
rm 22-10-2019-Lunes-4caaa439-a948-47da-8ac4-4fccc4715f92.md 
ls
cat ALSA_NATALIA.csv 
compile productor_consumidor_varios_su.cpp Semaphore.cpp HoareMonitor.cpp -o su && val ./su
compile -g -I./ productor_consumidor_varios_su.cpp Semaphore.cpp HoareMonitor.cpp -o pruebas && val ./pruebas 
compile productor_consumidor_varios_su.cpp Semaphore.cpp HoareMonitor.cpp -o pruebas && val ./pruebas
gcommit
rm vgcore.*
ls
rm prueba su varios_su 
ls
compile productor_consumidor_varios_su.cpp Semaphore.cpp HoareMonitor.cpp -o pruebas && val ./pruebas
./pruebas
val ./pruebas
make varios_sc
make exe_varios_sc
compile productor_consumidor_varios_su.cpp Semaphore.cpp HoareMonitor.cpp -o pruebas && val ./pruebas 
ls
rm pruebas.cpp 
ls
make clean
gcommit
git push origin master
ls
rm varios_su 
ls
make clean
ls
rm pruebas
make
make exe_varios_sc
ls
make clean
ls
make exe_varios_sc
ls
make clean
make exe_varios_sc
ls
make exe_varios_sc
make exe_varios_su
ls
compile -g pruebas.cpp HoareMonitor.cpp Semaphore.cpp -o pruebas && val ./pruebas
./pruebas
compile -g pruebas.cpp HoareMonitor.cpp Semaphore.cpp -o pruebas && val ./pruebas
nv
gpush
wallpaper -c autumn_cascade.jpg
