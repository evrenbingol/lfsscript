thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

sh Configure -des -Dprefix=/tools -Dlibs=-lm -Uloclibpth -Ulocincpth
make
cp -v perl cpan/podlators/scripts/pod2man /tools/bin
mkdir -pv /tools/lib/perl5/5.30.1
cp -Rv lib/* /tools/lib/perl5/5.30.1
source $CWD/tools/closetar.sh 