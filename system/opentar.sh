

cd $LFSSOURCE
echo "tar root: $TARROOT"

arrIN=(${thisfilename//_/ })
number_removed=${arrIN[1]}
tarfile=${number_removed%.*}

echo "tarfile: $tarfile"

if [[ $tarfile == ".tar.*" ]] ; then
	echo "tarfile file not handled correctly"
	exit
else
	tarfile_folder=${tarfile%.tar.*}
fi

echo $LFSSOURCE/$tarfile_folder
rm -rf $LFSSOURCE/$tarfile_folder
echo "Extracting : $TARROOT/$tarfile"
mkdir $LFSSOURCE/$tarfile_folder
tar -xf $TARROOT/$tarfile -C $LFSSOURCE/$tarfile_folder --strip-components 1
echo "TAR FOLDER :$LFSSOURCE/$tarfile_folder"
cd $LFSSOURCE/$tarfile_folder
