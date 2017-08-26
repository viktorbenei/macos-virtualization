# macos-virtualization

MacOS virtualization - mainly links

## Working VirtualBox / Packer scripts!! (2016.12)

- https://github.com/timsutton/osx-vm-templates
- related tutorial: https://spin.atomicobject.com/2015/11/17/vagrant-osx/
- and our related tool, based on these articles & repos: https://github.com/bitrise-tools/replica


## KVM / QEMU

- My own KVM + QEMU experiment can be found (with links!) in the [own-kvm-qemu-experiment](https://github.com/viktorbenei/macos-virtualization/tree/master/own-kvm-qemu-experiment) directory
- Running Mac OS X El Capitan and macOS Sierra on QEMU/KVM: https://github.com/kholia/OSX-KVM
    - Related discussion with even more links: https://news.ycombinator.com/item?id=12556609

## vagrant / VirtualBox

### Own experiment

Some notes for experimenting with VirtualBox based OS X VMs:

* how to install OS X guest in VirtualBox running on OS X: [http://engineering.bittorrent.com/2014/07/16/how-to-guide-for-mavericks-vm-on-mavericks/](http://engineering.bittorrent.com/2014/07/16/how-to-guide-for-mavericks-vm-on-mavericks/)
  * detailed step-by-step guide, with images, from step 0 (downloading OS X installer from the App Store) to up-and-running
  * NOTES:
    * the new Haswell based Intel CPUs are still not yet properly supported
    and require a (quick) workaround - detailed in the article.
    * to tweak the CPU performance you could try other CPU IDs:
      * `VBoxManage modifyvm <vmname> --cpuidset 1 000206a7 02100800 1fbae3bf bfebfbff` [source](https://www.virtualbox.org/ticket/12802)
    * our best configuration so far (set it before starting the VM!)
      * 2 CPU, execution cap 100%
      * 4096 MB RAM
      * Chipset: PIIX3
      * 128MB VRAM (video ram)
      * enable all the acceleration features (except 2D acceleration)
      * if required: `VBoxManage modifyvm <vmname> --cpuidset 1 000206a7 02100800 1fbae3bf bfebfbff`
* to be able to SSH into the VM through the default NAT network adapter
  (which is required for vagrant) you have to set up a port forwarding
  with: host 127.0.0.1 port 2222 -> guest 22
    * vagrant does this automatically but if you want to test
      the SSH login of the box before packaging it you'll have to
      do it yourself
* Start the VM
* Install OS X
    * In general for `vagrant` to be able to work with the VM you just have to:
        * create a user with username `vagrant` and password `vagrant`
        * enable "remote login" (SSH) in MacOS
        * preferably add the "vagrant insecure SSH key" to `~/.ssh/authorized_keys`
        * also preferably enable passwordless sudo for the `vagrant` user, at the end of `sudo visudo` add: `vagrant ALL=(ALL) NOPASSWD: ALL`
