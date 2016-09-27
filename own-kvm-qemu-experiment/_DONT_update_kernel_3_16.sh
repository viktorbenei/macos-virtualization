#!/bin/bash

#
# Based on: http://ubuntuhandbook.org/index.php/2014/08/install-upgrade-linux-kernel-3-16/
#
# [!]
#  If for some reason this kernel release doesn’t work properly for you, reboot into previous kernel (Grub -> Advanced -> select previous kernel) and run this command to remove Linux Kernel 3.16:
#  sudo apt-get remove linux-headers-3.16.0-* linux-image-3.16.0-*
#  Finally update grub menu:
#  sudo update-grub
#

function print_and_do_command {
	echo "-> $ $@"
	$@
}

function print_and_do_command_exit_on_error {
	print_and_do_command $@
	if [ $? -ne 0 ]; then
		echo " [!] Failed!"
		exit 1
	fi
}

echo "--- Updating kernel to 3.16"
echo "    More info: "
echo "------------------------------------------"
echo

print_and_do_command_exit_on_error cd /tmp/

print_and_do_command_exit_on_error wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.16-utopic/linux-headers-3.16.0-031600-generic_3.16.0-031600.201408031935_amd64.deb

print_and_do_command_exit_on_error wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.16-utopic/linux-headers-3.16.0-031600_3.16.0-031600.201408031935_all.deb

print_and_do_command_exit_on_error wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.16-utopic/linux-image-3.16.0-031600-generic_3.16.0-031600.201408031935_amd64.deb

print_and_do_command_exit_on_error sudo dpkg -i linux-headers-3.16.0-*.deb linux-image-3.16.0-*.deb

echo
echo "-----------------------------------------"
echo "--- Finished; Reboot and done."