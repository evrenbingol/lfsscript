thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 
./configure --prefix=/tools --without-bash-malloc
make
make install
ln -sv bash /tools/bin/sh
source $CWD/tools/closetar.sh 