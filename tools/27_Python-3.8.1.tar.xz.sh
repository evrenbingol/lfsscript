thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 
sed -i '/def add_multiarch_paths/a \        return' setup.py
./configure --prefix=/tools --without-ensurepip
make
make install
source $CWD/tools/closetar.sh 