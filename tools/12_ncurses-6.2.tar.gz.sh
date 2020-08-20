thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 
sed -i s/mawk// configure
./configure --prefix=/tools \
            --with-shared   \
            --without-debug \
            --without-ada   \
            --enable-widec  \
            --enable-overwrite
make    
make install
ln -s libncursesw.so /tools/lib/libncurses.so      
source $CWD/tools/closetar.sh 