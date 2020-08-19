#!/bin/bash
source config

fetch() {	
	path=$2
	tarballname=$(basename $1)
	
	
	WGETCMD="wget  --tries=3 --waitretry=3 --output-document=$path/$tarballname.partial"
	WGETRESUME="-c"
	
	if [ -f $2/$tarballname ]; then
		echo "Source file $tarballname found."
		return 0
	else
		if [ -f $2/$tarballname.partial ]; then
			echo "Resuming $1"
			$WGETCMD $WGETRESUME $1
		else
			mkdir -p "$2"
			echo "Downloading $1"
			$WGETCMD $1
		fi
	fi
	
	if [ $? = 0 ]; then
		mv $2/$tarballname.partial $2/$tarballname
	else
		echo "Failed fetching source: $tarballname"
		exit 1
	fi	
}

CWD=$PWD

input="$CWD/wget-list.txt"
TARROOT=$CWD$LFSTARS
echo $TARROOT

if test -d "$TARROOT"; then
    echo "$TARROOT exists."
else
	echo "$TARROOT does not exist."
  	mkdir $TARROOT
fi


while IFS= read -r FILE
do
 
  extractedname="${FILE##*/}"
  
  if test -f "$TARROOT/$extractedname" ; then
    echo "$TARROOT/$extractedname exists."
  else
  	echo "$TARROOT/$extractedname  does not exists."
  	fetch $FILE $TARROOT
  fi
  
done < "$input"
exit
cp md5sums.txt $TARROOT
pushd $TARROOT
md5sum -c md5sums.txt
rm md5sums.txt
popd
