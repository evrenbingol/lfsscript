#!/bin/bash

source config
DRIVE=$1
SWAP=$2
echo $1
echo $SWAP



if [ -d "$LFS" ]; then
	echo "$LFS exists" 
else
	mkdir -v $LFS
	echo "$LFS created" 
fi



if [ "ext4" = $(df -Th | grep $DRIVE | awk '{print $2}') ]; then
	echo "DRIVE is ext4"
else
	mkfs -v -t ext4 $DRIVE
fi

if grep -qs $LFS /proc/mounts; then
    echo "$LFS is mounted."
else
    sudo mount -v -t ext4 $DRIVE $LFS
fi

echo "$LFS is mount completed."




echo "swap off"
swapoff /dev/sda2

if grep -qs $SWAP /proc/swaps; then
    echo "$SWAP is swap."
else
	echo "making swap"
    mkswap $SWAP
fi

echo "Turning Swapon"
/sbin/swapon -v $SWAP


if [ -d "$LFSSOURCE" ]; then
	echo "$LFSSOURCE exists" 
else
	mkdir -v $LFSSOURCE
	chmod -v a+wt $LFSSOURCE
	echo "$LFSSOURCE created" 
fi


linkedtool=/tools

if [ -d "$LFSTOOLS" ]; then
	echo "$LFSTOOLS exists" 
else
	sudo mkdir -v $LFSTOOLS
	echo "$LFSTOOLS created" 
fi




if [ -L $linkedtool ] ; then
   if [ -e $linkedtool ] ; then
      echo "Good link"
   else
      echo "Broken link"
      sudo rm linkedtool
      sudo ln -sv $LFSTOOLS /
   fi
elif [ -e $linkedtool ] ; then
   sudo rm $linkedtool
   sudo ln -sv $LFSTOOLS /
else
   echo "Missing"
   sudo rm $linkedtool
   sudo ln -sv $LFSTOOLS /
fi

