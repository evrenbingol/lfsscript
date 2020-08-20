thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h
./configure --prefix=/tools
make
make install
source $CWD/tools/closetar.sh 