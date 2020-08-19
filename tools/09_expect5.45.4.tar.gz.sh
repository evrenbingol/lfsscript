thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

cp -v configure{,.orig}
sed 's:/usr/local/bin:/bin:' configure.orig > configure

./configure --prefix=/tools       \
            --with-tcl=/tools/lib \
            --with-tclinclude=/tools/include


make 
make SCRIPTS="" install

source $CWD/tools/closetar.sh 