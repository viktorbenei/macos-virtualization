
# TODO / READ-THESE

* vagrant-kvm provider's libvirt domain xml and example box setup: https://github.com/adrahon/vagrant-kvm/tree/master/example_box

# Links

* amazon KVM 101 / tutorial: [http://xmodulo.com/use-kvm-command-line-debian-ubuntu.html](http://xmodulo.com/use-kvm-command-line-debian-ubuntu.html)
  * NOTES:
  * on Ubuntu 14.04 libvirt install added my user to the *libvirtd* group,
    I didn't have to do it manually
  * on Ubuntu 14.04 after KVM install I didn't have to setup the bridged adapter,
    it was already prepared
* A "gettings started" guide: http://wiki.libvirt.org/page/UbuntuKVMWalkthrough

## QEMU/libvirt info links

* info about virsh qemu drivers (what does qemu:///system means...) http://libvirt.org/drvqemu.html#uris
* and a libvirt qemu specific doc in general: http://libvirt.org/drvqemu.html
* converting direct QEMU arguments to libvirt domain XML: https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Virtualization_Administration_Guide/sect-virsh-domxml-from-native.html

# NOTES

*


# Cheat-Sheat

## virsh

* $ virsh --connect qemu:///system
  * list
  * create descriptor.xml
  * destroy domainname


## convert qemu args to domain xml

$ virsh domxml-from-native qemu-argv demo.args

http://libvirt.org/drvqemu.html#xmlimport


## other

* $ qemu-img create -f qcow2 /path/to/img/hdd.img 5G

# Further install notes

* install *curl*
//* install RVM
* build-essential ruby2.0-dev libvirt-dev libxslt1-dev libxml2-dev
	* for vagrant-kvm: https://github.com/adrahon/vagrant-kvm/blob/master/INSTALL.md