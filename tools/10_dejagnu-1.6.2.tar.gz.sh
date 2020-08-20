thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

./configure --prefix=/tools
make install
make check


source $CWD/tools/closetar.sh 