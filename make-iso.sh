#!/bin/bash
#
# This script will create a new custom ISO
#
iso_name="ubuntu-24.04.1-auto-server.iso"
if test -f $iso_name; then
  echo "Cleaning up old ISO..."
  rm $iso_name
fi

echo "Creating new ISO..."
now=$(date "+%Y%m%d%H%M%S00")
xorriso -as mkisofs -r \
-V "Ubuntu-Server 24.04.1 LTS amd64" \
-o $iso_name \
--modification-date=$now \
--grub2-mbr BOOT/1-Boot-NoEmul.img \
--protective-msdos-label \
-partition_cyl_align off \
-partition_offset 16 \
--mbr-force-bootable \
-append_partition 2 28732ac11ff8d211ba4b00a0c93ec93b BOOT/2-Boot-NoEmul.img \
-appended_part_as_gpt \
-iso_mbr_part_type a2a0d0ebe5b9334487c068b6b72699c7 \
-c "/boot.catalog" \
-b "/boot/grub/i386-pc/eltorito.img" \
-no-emul-boot \
-boot-load-size 4 \
-boot-info-table \
--grub2-boot-info \
-eltorito-alt-boot \
-e "--interval:appended_partition_2_start_1351729s_size_10144d:all::" \
-no-emul-boot \
-boot-load-size 10144 \
source-files