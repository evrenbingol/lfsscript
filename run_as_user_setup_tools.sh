CWD=$1
echo $CWD

source $CWD/config

homeofuser=$(eval echo ~${USER})


echo $homeofuser
set +h
umask 022


PATH=/tools/bin:/bin:/usr/bin
HOME=$homeofuser
TERM=$TERM
PS1='\u:\w\$ '

echo "HUH"
echo $CWD

#source $CWD/tools/01_binutils-2.34.tar.xz.sh $CWD  
#source $CWD/tools/02_gcc-9.2.0.tar.xz.sh $CWD
#source $CWD/tools/03_linux-5.5.3.tar.xz.sh $CWD
#source $CWD/tools/04_glibc-2.31.tar.xz.sh $CWD 
#source $CWD/tools/05_gcc-9.2.0.tar.xz.sh $CWD
#source $CWD/tools/06_binutils-2.34.tar.xz.sh $CWD  
#source $CWD/tools/07_gcc-9.2.0.tar.xz.sh $CWD

source $CWD/tools/08_tcl8.6.10-src.tar.gz.sh  $CWD

