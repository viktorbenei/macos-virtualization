#!/bin/bash

vm_hdd_img_file_path="/media/viktor/pground/osxtestvm/mac_hdd.img"
osx_install_iso_path="/media/viktor/ExFat-1TB/Bitrise/TMP-EXP/MavericksVBiESD-BaseSystem-iso.iso"
osx_osk_key="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
chameleon_file_path="./chameleon_svn2360_boot"

echo "--start--"

#sudo qemu-system-x86_64 -enable-kvm -m 3072 -cpu core2duo -machine q35 -smp 2 -usbdevice keyboard -usbdevice mouse -vga std -device isa-applesmc,osk="ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc" -bios bios-mac.bin -kernel ./chameleon_svn2360_boot -device ide-drive,bus=ide.2,drive=MacHDD -drive id=MacHDD,if=none,cache=none,file=/media/viktor/pground/osxtestvm/mac_hdd.img -device ide-drive,bus=ide.0,drive=MacDVD -drive id=MacDVD,if=none,snapshot=on,file=/media/viktor/ExFat-1TB/Bitrise/TMP-EXP/MavericksVBiESD-BaseSystem-iso.iso -boot once=d
sudo qemu-system-x86_64 -enable-kvm \
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
-device ide-drive,bus=ide.0,drive=MacDVD \
-drive id=MacDVD,if=none,snapshot=on,file="${osx_install_iso_path}" \
-boot once=d

echo "--done--"