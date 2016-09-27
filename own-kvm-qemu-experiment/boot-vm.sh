#!/bin/bash

vm_hdd_img_file_path="/home/viktor/vm-hdds/mac_hdd.img"
osx_osk_key="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
chameleon_file_path="./chameleon_svn2360_boot"

echo "--start--"

# sudo qemu-system-x86_64 -enable-kvm \
# qemu-system-x86_64 -enable-kvm \
# -m 3072 \
# -cpu core2duo \
# -machine q35 \
# -smp 2 \
# -usbdevice keyboard \
# -usbdevice mouse \
# -vga std \
# -device isa-applesmc,osk="${osx_osk_key}" \
# -kernel "${chameleon_file_path}" \
# -device ide-drive,bus=ide.2,drive=MacHDD \
# -drive id=MacHDD,if=none,cache=none,file="${vm_hdd_img_file_path}" \
# -net nic,model=e1000,netdev=virbr0,macaddr=52:54:00:8e:57:05 \
# -netdev tap,id=virbr0

qemu-system-x86_64 -enable-kvm \
-m 3072 \
-cpu core2duo \
-machine q35 \
-smp 2 \
-usbdevice keyboard \
-usbdevice mouse \
-vga std \
-device isa-applesmc,osk="${osx_osk_key}" \
-kernel "${chameleon_file_path}" \
-device ide-drive,bus=ide.2,drive=MacHDD \
-drive id=MacHDD,if=none,cache=none,file="${vm_hdd_img_file_path}" \
-netdev user,id=hub0port0 \
-device virtio-net,netdev=hub0port0,id=eth0

# -device ide-drive,bus=ide.4,drive=fatdrive \
# -drive id=fatdrive,file=fat:ro:VirtIoNetDrv

echo "--done--"