

thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

cd unix
./configure --prefix=/tools
make 
make install
chmod -v u+w /tools/lib/libtcl8.6.so
make install-private-headers
ln -sv tclsh8.6 /tools/bin/tclsh

source $CWD/tools/closetar.sh 