sudo ./setup.sh /dev/sda1 /dev/sda2
source download_files.sh
source setuptools.sh
sudo -u lfs  ./run_as_user_setup_tools.sh $PWD
sudo -u root ./tools/99_change_ownership.sh #chapter 5 ends
sudo -u root ./prep_virtual_kernel.sh $PWD
sudo -u root ./createdirectories.sh $PWD
