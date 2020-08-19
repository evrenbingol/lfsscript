source config



group=lfs
username=lfs


if grep -q $group /etc/group ; then
	echo "group exists"
else
	echo "group does not exist"
	sudo groupadd $group
fi

if grep "${username}" /etc/passwd >/dev/null 2>&1; then
  # do something if the user exists
  echo "user exists"
else
  sudo useradd -s /bin/bash -g $group -m -k /dev/null $username
  echo "Adding user : $username to group $group"
  passwd ${username}
fi

echo $LFSTOOLS
sudo chown -v $username $LFSTOOLS
sudo chown -v $username	$LFSSOURCE
ls -la $LFSTOOLS

echo $PWD/run_as_user_setup_tools.sh
echo ~${username}

homeofuser=$(eval echo ~${username})
echo ${homeofuser}
ls ${homeofuser}

sudo rm -rf ${homeofuser}/run_as_user_setup_tools.sh


sudo cp -rf $PWD/run_as_user_setup_tools.sh ${homeofuser}

