thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 
./configure --prefix=/tools --without-guile
make
make install

source $CWD/tools/closetar.sh 