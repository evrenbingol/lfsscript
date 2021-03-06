thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

make -f Makefile-libbz2_so
make clean
make

make PREFIX=/tools install
cp -v bzip2-shared /tools/bin/bzip2
cp -av libbz2.so* /tools/lib
ln -sv libbz2.so.1.0 /tools/lib/libbz2.so

source $CWD/tools/closetar.sh 