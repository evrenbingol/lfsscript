
thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

make mrproper
make headers
cp -rv usr/include/* /tools/include

source $CWD/tools/closetar.sh 
