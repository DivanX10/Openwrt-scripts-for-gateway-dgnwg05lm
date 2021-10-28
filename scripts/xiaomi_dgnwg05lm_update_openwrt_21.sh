#We are updating OpenWRT on the Xiaomi DGNWG05LM gateway from version 19.07 to 21.02
#Script for updating OpenWRT from version 19.07 to 21.02 by @Divan
#!/bin/sh
cd /tmp
echo "Starting the procedure for updating OpenWRT from version 19.07 to 21.02"
sleep 2
wget https://github.com/openlumi/openwrt/releases/download/v21.02.0-20210902/u-boot.imx -O /tmp/u-boot.imx&&
wget https://github.com/openlumi/openwrt/releases/download/v21.02.0-20210902/openwrt-imx6-imx6ull-xiaomi-dgnwg05lm.dtb -O /tmp/openwrt-imx6-imx6ull-xiaomi-dgnwg05lm.dtb&&
wget https://github.com/openlumi/openwrt/releases/download/v21.02.0-20210902/openwrt-imx6-xiaomi_dgnwg05lm-squashfs-sysupgrade.bin -O /tmp/openwrt-imx6-xiaomi_dgnwg05lm-squashfs-sysupgrade.bin&&
echo "The files are downloaded to the tmp folder. Done"
sleep 2
echo "Starting replace model marks to allow upgrade with new files for update OpenWRT 21"
sed -i 's/gw5/xiaomi,dgnwg05lm/' /lib/upgrade/platform.sh&&
sed -i 's/Wandboard i.MX6 Dual Lite Board/Xiaomi Gateway DGNWG05LM/' /lib/imx6.sh&&
sed -i 's/name="wandboard"/name="xiaomi,dgnwg05lm"/' /lib/imx6.sh&&
echo 'xiaomi,dgnwg05lm' > /tmp/sysinfo/board_name&&
echo 'Xiaomi Gateway DGNWG05LM' > /tmp/sysinfo/model&&
sed -i 's/"id": "[-a-z\.,]*"/"id": "xiaomi,dgnwg05lm"/' /tmp/board.json&&
sed -i 's/board_name="$1"/board_name="${1\/,\/_}"/' /lib/upgrade/nand.sh&&
echo "Replace Done"
sleep 2
echo "Starting write new uboot"
opkg update && opkg install kobs-ng&&
[ -f u-boot.imx ] && kobs-ng init -x -v --chip_0_device_path=/dev/mtd0 u-boot.imx&&
echo "Write Uboot Done"
sleep 2
echo "Starting write new dtb"
[ -f openwrt-imx6-imx6ull-xiaomi-dgnwg05lm.dtb ] && flash_erase /dev/mtd2 0 0 && nandwrite -p /dev/mtd2 -p openwrt-imx6-imx6ull-xiaomi-dgnwg05lm.dtb&&
echo "Write Uboot Done"
sleep 2
echo "Starting run sysupgrade in console"
[ -f openwrt-imx6-xiaomi_dgnwg05lm-squashfs-sysupgrade.bin ] && sysupgrade -v -n openwrt-imx6-xiaomi_dgnwg05lm-squashfs-sysupgrade.bin&&
echo "Firmware update to OpenWRT version 21 has been completed"
