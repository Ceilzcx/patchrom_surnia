#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 9189376 c494326766f4b1ad06ede2ff96ff27a711cd5dd0 6721536 493f86b58c10e49a091f6463d32cd58054897cc1
fi

if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:9189376:c494326766f4b1ad06ede2ff96ff27a711cd5dd0; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:6721536:493f86b58c10e49a091f6463d32cd58054897cc1 EMMC:/dev/block/bootdevice/by-name/recovery c494326766f4b1ad06ede2ff96ff27a711cd5dd0 9189376 493f86b58c10e49a091f6463d32cd58054897cc1:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
