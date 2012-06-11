echo "Copying"
cp arch/arm/common/cpaccess.ko ../Ramdisk/lib/modules/cpaccess.ko 
cp arch/arm/mach-msm/reset_modem.ko ../Ramdisk/lib/modules/reset_modem.ko 
cp arch/arm/mach-msm/dma_test.ko ../Ramdisk/lib/modules/dma_test.ko 
cp crypto/ansi_cprng.ko ../Ramdisk/lib/modules/ansi_cprng.ko 
cp drivers/net/wireless/bcmdhd/bcmdhd.ko ../Ramdisk/lib/modules/bcmdhd.ko 
cp drivers/net/wireless/libra/librasdioif.ko ../Ramdisk/lib/modules/librasdioif.ko 
cp drivers/net/kineto_gan.ko ../Ramdisk/lib/modules/kineto_gan.ko 
cp drivers/staging/ti-st/fm_drv.ko ../Ramdisk/lib/modules/fm_drv.ko 
cd ../Ramdisk/lib/modules

for i in $(find . | grep .ko | grep './')
do
        echo $i

/home/aditya/Toolchain/arm-eabi-4.4.3/bin/arm-eabi-strip --strip-unneeded $i
done

echo "Stripping"
echo "DONE"
