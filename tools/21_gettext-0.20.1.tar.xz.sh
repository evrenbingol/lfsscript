thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

./configure --disable-shared
make
cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /tools/bin
source $CWD/tools/closetar.sh 