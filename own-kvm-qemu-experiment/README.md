# readme

# What's the goal?

To set up an OS X Virtual Machine using QEMU on Ubuntu, with as few modifications to both OS X and to Ubuntu as possible.


# Pre requisites

* install KVM, libvirt based on this guide: http://xmodulo.com/use-kvm-command-line-debian-ubuntu.html
	* NOTES:
		* on Ubuntu 14.10 you don't have to add a virtual network, the *qemu-kvm libvirt-bin* install adds it automatically
		* group: on Ubuntu 14.10 the user who installs qemu / libvirt is automatically added to the *libvirtd* group after a restart (sign out, sign in)
			* you can check it with `id`, the last group after install should be *127(libvirtd)*
* update the Linux kernel to >= 3.15 (Ubuntu 14.04 ships with 3.13 - use generic kernel):
	* IMPORTANT! The 2013 rMBP's Broadcom BCM4360 wifi chip's driver is not compatible with
		these kernels -> update Ubuntu to 14.10 instead (of updating the kernel manually),
		that ships with kernel 3.16!
		14.10 is not yet out (will be release at 2014.10.21), you can upgrade to the
		latest version with:
			$ update-manager -d
	* 3.15: http://ubuntuhandbook.org/index.php/2014/06/install-upgrade-linux-kernel-3-15/
	* 3.16: http://ubuntuhandbook.org/index.php/2014/08/install-upgrade-linux-kernel-3-16/
* download and compile QEMU >= 2.1.0 (Ubuntu 14.04 ships with 2.0.0)
	* Ubuntu 14.10 includes QEMU 2.1.0
	* you can get the KVM/QEMU version with:
		* $ kvm --version
		* or: $ qemu-system-x86_64 --version


# Links

* main source of infos: http://www.contrib.andrew.cmu.edu/~somlo/OSXKVM/
* newer:
	* http://blog.ostanin.org/2014/02/11/playing-with-mac-os-x-on-kvm/
	* http://blog.definedcode.com/osx-qemu-kvm
* related HackerNews comments: https://news.ycombinator.com/item?id=7847852


# Guide

Create a 'growing' HDD image for the VM:

$ qemu-img create -f qcow2 mac_hdd.img 30G

## To get OSK "pass-through" / AppleSMC code

Use the *SmcDumpKey.c* program in this folder:

$ cd /this/dir/path
$ sudo apt-get install -y clang
$ clang SmcDumpKey.c -o SmcDumpKey
$ sudo ./SmcDumpKey OSK0
$ sudo ./SmcDumpKey OSK1

the results should be (something like this):
0: ourhardworkbythesewordsguardedpl
1: easedontsteal(c)AppleComputerInc
sum: ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc


# Create an OS X (Mavericks) install ISO

You can build an installable DMG the way described here: http://engineering.bittorrent.com/2014/07/16/how-to-guide-for-mavericks-vm-on-mavericks/

Then convert it to an ISO: http://osxdaily.com/2012/07/18/convert-dmg-to-cdr-or-iso-with-disk-utility/


# Start the VM with the install ISO

At this point you have everything required to start the VM and the installation of OS X.

To do this you can use the *./start-osx-vm-install.sh* script (if it's already installed you can use
the *boot-vm.sh* script to boot it).

# Networking

The steps described at [http://www.contrib.andrew.cmu.edu/~somlo/OSXKVM/](http://www.contrib.andrew.cmu.edu/~somlo/OSXKVM/) in the *3.3. The virtio-net virtual network card* section worked.


# Management

At this point we have a functional OS X VM we should manage.

More info in the *libvirt* folder.