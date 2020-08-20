
source chroot_config 




thisfilename=$(basename "$BASH_SOURCE")


source $LFS/opentar.sh 

make mrproper
make headers
find usr/include -name '.*' -delete
rm usr/include/Makefile
cp -rv usr/include/* /usr/include

source $LFS/closetar.sh 
