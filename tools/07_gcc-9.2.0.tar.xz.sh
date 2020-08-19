thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 

cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  `dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/include-fixed/limits.h

for file in gcc/config/{linux,i386/linux{,64}}.h
do
  cp -uv $file{,.orig}
  sed -e 's@/lib\(64\)\?\(32\)\?/ld@/tools&@g' \
      -e 's@/usr@/tools@g' $file.orig > $file
  echo '
#undef STANDARD_STARTFILE_PREFIX_1
#undef STANDARD_STARTFILE_PREFIX_2
#define STANDARD_STARTFILE_PREFIX_1 "/tools/lib/"
#define STANDARD_STARTFILE_PREFIX_2 ""' >> $file
  touch $file.orig
done

case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' \
        -i.orig gcc/config/i386/t-linux64
  ;;
esac

	rm -rf $LFSSOURCE/mpfr-4.0.2
	rm -rf $LFSSOURCE/gmp-6.2.0
	rm -rf $LFSSOURCE/mpc-1.1.0

	tar -xf $TARROOT/mpfr-4.0.2.tar.xz -C $LFSSOURCE
	tar -xf $TARROOT/gmp-6.2.0.tar.xz -C $LFSSOURCE
	tar -xf $TARROOT/mpc-1.1.0.tar.gz -C $LFSSOURCE
	
	mv -v $LFSSOURCE/mpfr-4.0.2 $LFSSOURCE/$tarfile_folder/mpfr
	mv -v $LFSSOURCE/gmp-6.2.0 $LFSSOURCE/$tarfile_folder/gmp
	mv -v $LFSSOURCE/mpc-1.1.0 $LFSSOURCE/$tarfile_folder/mpc

sed -e '1161 s|^|//|' \
    -i libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc

mkdir -v build
cd       build

CC=$LFS_TGT-gcc                                    \
CXX=$LFS_TGT-g++                                   \
AR=$LFS_TGT-ar                                     \
RANLIB=$LFS_TGT-ranlib                             \
../configure                                       \
    --prefix=/tools                                \
    --with-local-prefix=/tools                     \
    --with-native-system-header-dir=/tools/include \
    --enable-languages=c,c++                       \
    --disable-libstdcxx-pch                        \
    --disable-multilib                             \
    --disable-bootstrap                            \
    --disable-libgomp

make

make install

ln -sv gcc /tools/bin/cc


echo 'int main(){}' > dummy.c
cc dummy.c
readelf -l a.out | grep ': /tools'
rm -v dummy.c a.out

source $CWD/tools/closetar.sh 