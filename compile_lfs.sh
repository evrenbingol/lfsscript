sudo ./setup.sh /dev/sda1 /dev/sda2
source download_files.sh
source setuptools.sh
sudo -u lfs  ./run_as_user_setup_tools.sh $PWD
sudo -u root ./99_change_ownership.sh #chapter 5 ends