thisfilename=$(basename "$BASH_SOURCE")
source $CWD/tools/opentar.sh 




	mkdir -v build
	cd       build
	
	../configure                             \
		  --prefix=/tools                    \
		  --host=$LFS_TGT                    \
		  --build=$(../scripts/config.guess) \
		  --enable-kernel=3.2             \
		  --with-headers=/tools/include
	make
	make install

source $CWD/tools/closetar.sh 