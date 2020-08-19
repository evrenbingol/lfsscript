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


source $CWD/tools/01_binutils-2.34.tar.xz.sh $CWD  
source $CWD/tools/02_gcc-9.2.0.tar.xz.sh $CWD
source $CWD/tools/03_linux-5.5.3.tar.xz.sh $CWD
source $CWD/tools/04_glibc-2.31.tar.xz.sh $CWD 
source $CWD/tools/05_gcc-9.2.0.tar.xz.sh $CWD
source $CWD/tools/06_binutils-2.34.tar.xz.sh $CWD  
source $CWD/tools/07_gcc-9.2.0.tar.xz.sh $CWD
source $CWD/tools/08_tcl8.6.10-src.tar.gz.sh  $CWD
source $CWD/tools/10_dejagnu-1.6.2.tar.gz.sh $CWD
source $CWD/tools/11_m4-1.4.18.tar.xz.sh $CWD
source $CWD/tools/12_ncurses-6.2.tar.gz.sh $CWD
source $CWD/tools/13_bash-5.0.tar.gz.sh $CWD
source $CWD/tools/14_bison-3.5.2.tar.xz.sh $CWD
source $CWD/tools/15_bzip2-1.0.8.tar.gz.sh $CWD
source $CWD/tools/16_coreutils-8.31.tar.xz.sh $CWD
source $CWD/tools/17_diffutils-3.7.tar.xz.sh $CWD
source $CWD/tools/18_file-5.38.tar.gz.sh $CWD
source $CWD/tools/19_findutils-4.7.0.tar.xz.sh $CWD
source $CWD/tools/20_gawk-5.0.1.tar.xz.sh $CWD
source $CWD/tools/21_gettext-0.20.1.tar.xz.sh $CWD
source $CWD/tools/22_grep-3.4.tar.xz.sh $CWD
source $CWD/tools/23_gzip-1.10.tar.xz.sh $CWD
source $CWD/tools/24_make-4.3.tar.gz.sh $CWD
source $CWD/tools/25_patch-2.7.6.tar.xz.sh $CWD
source $CWD/tools/26_perl-5.30.1.tar.xz.sh $CWD
source $CWD/tools/27_Python-3.8.1.tar.xz.sh $CWD
source $CWD/tools/28_sed-4.8.tar.xz.sh $CWD
source $CWD/tools/29_tar-1.32.tar.xz.sh $CWD
source $CWD/tools/30_texinfo-6.7.tar.xz.sh $CWD
source $CWD/tools/31_xz-5.2.4.tar.xz.sh $CWD
source $CWD/tools/98_strip.sh $CWD
source $CWD/tools/ $CWD















