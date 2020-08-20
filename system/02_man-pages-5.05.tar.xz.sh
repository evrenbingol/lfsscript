
source chroot_config 




thisfilename=$(basename "$BASH_SOURCE")


source $LFS/opentar.sh 

make install

source $LFS/closetar.sh 
