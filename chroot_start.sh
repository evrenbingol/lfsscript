CWD=$1
echo $CWD
source $CWD/config


unmount() {
	while true; do
		mountpoint -q $1 || break
		umount $1 2>/dev/null
	done
}


mount_pseudo() {
	mkdir -p $LFS/{dev,run,proc,sys}
	mount --bind /dev $LFS/dev
	mount -t devpts devpts $LFS/dev/pts -o gid=5,mode=620
	mount -t proc proc $LFS/proc
	mount -t sysfs sysfs $LFS/sys
	mount -t tmpfs tmpfs $LFS/run
	if [ -h $LFS/dev/shm ]; then
	  mkdir -p $LFS/$(readlink $LFS/dev/shm)
	fi
}

umount_pseudo() {
	unmount $LFS/dev/pts
	unmount $LFS/dev
	unmount $LFS/run
	unmount $LFS/proc
	unmount $LFS/sys
}

runinchroot() {
	echo "In runinchroot"
	echo $LFS
	echo $TERM
	pushd $LFS &>/dev/null
	mount_pseudo
	#cp -L /etc/resolv.conf $LFS/etc/
	chroot "$LFS" /tools/bin/env -i \
	    HOME=/root                  \
	    TERM="$TERM"                \
	    PS1='(lfs chroot) \u:\w\$ ' \
	    PATH=/bin:/usr/bin:/sbin:/usr/sbin:/tools/bin /tools/bin/bash --login +h $@

	retval=$?
	umount_pseudo
	echo $retval
	popd &>/dev/null
	return $retval
}


#THERE ARE FILES THAT NEEDS TO EXEC IN CHROOT SO FILES WILL BE COPIED THERE AND REMOVE AFTER


cp -v $CWD/chroot_config $LFS

#cp -v $CWD/createdirectories.sh $LFS  
#runinchroot   ./createdirectories.sh
#rm $LFS/createdirectories.sh

cp -v $CWD/system/closetar.sh $LFS 
cp -v $CWD/system/opentar.sh $LFS



cp -v $CWD/system/01_linux-5.5.3.tar.xz.sh $LFS 
runinchroot  01_linux-5.5.3.tar.xz.sh
rm $LFS/01_linux-5.5.3.tar.xz.sh


rm $LFS/closetar.sh
rm $LFS/opentar.sh


#runinchroot makesymlinks