echo "Clear Up"
cd ..
rm *.gz 
rm *.img
rm *.zip 
cd Kernel 
echo "Start Compiling"
############################################################################################################################
echo "COMPILE KERNEL FOR SENSE" 
make clean mrproper
make titanium_defconfig 
make -j84
echo "Copy Modules to Sense Ramdisk"
find -name '*.ko' -exec cp -av {} ../boot.img-ramdisk/lib/modules/ \;
echo "Pack Sense Ramdisk"
tools/mkbootfs boot.img-ramdisk | gzip > boot.img-ramdisk-sense.gz
echo "Pack Sense boot.img"
./tools/mkbootimg --kernel Kernel/arch/arm/boot/zImage --ramdisk boot.img-ramdisk-sense.gz -o sense_boot.img --base 13f00000
#############################################################################################################################
sleep 5 
#############################################################################################################################
echo "Compile KERNEL for CM9/CM10"
make clean mrproper
make titanium_cm_defconfig
make -j84
echo "Copy Modules to CM10 Ramdisk"
find -name '*.ko' -exec cp -av {} ../boot-img-ramdisk-cm10/lib/modules/ \;
cd ..
echo "Pack CM10 Ramdisk"
tools/mkbootfs boot-img-ramdisk-cm10 | gzip > boot.img-ramdisk-cm10.gz
echo "Pack CM10 boot.img" 
./tools/mkbootimg --kernel Kernel/arch/arm/boot/zImage --ramdisk boot.img-ramdisk-cm10.gz -o cm10_boot.img --base 13f00000

######## CM10 DONE ####################

echo "Copy Modules to CM9 Ramdisk"
find -name '*.ko' -exec cp -av {} ../boot-img-ramdisk-cm9/lib/modules/ \;
cd ..
echo "Pack CM9 Ramdisk"
tools/mkbootfs boot-img-ramdisk-cm10 | gzip > boot.img-ramdisk-cm9.gz
echo "Pack CM9 boot.img" 
./tools/mkbootimg --kernel Kernel/arch/arm/boot/zImage --ramdisk boot.img-ramdisk-cm9.gz -o cm9_boot.img --base 13f00000

cd ..

zip TITANIUM_KERNEL.zip sense_boot.img cm9_boot.img cm10_boot.img README


echo "Done"
read ANS
