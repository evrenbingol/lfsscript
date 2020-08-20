thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 
./configure --prefix=/tools --enable-install-program=hostname
make
make install
source $CWD/tools/closetar.sh 