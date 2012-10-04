echo "Clear Up"
cd ..
rm *.gz 
rm *.img
rm *.zip 
cd Sense
rm *.gz 
rm *.img
rm *.zip 
cd ../CM10
rm *.gz
rm *.img
rm *.zip
cd ../Kernel 
echo "Start Compiling"
make clean mrproper
make titanium_defconfig 
make -j32
echo "Copy Modules to Sense Ramdisk"
find -name '*.ko' -exec cp -av {} ../boot.img-ramdisk/lib/modules/ \;
echo ".."
echo ".."
echo ".."
echo ".."
echo ".."
echo ".."
echo ".."
echo ".."
sleep 5 
echo "Copy Modules to CM10 Ramdisk"
find -name '*.ko' -exec cp -av {} ../boot-img-ramdisk-cm10/lib/modules/ \;
cd ..
echo "Pack Sense Ramdisk"
tools/mkbootfs boot.img-ramdisk | gzip > boot.img-ramdisk-sense.gz
echo "Pack CM10 Ramdisk"
tools/mkbootfs boot-img-ramdisk-cm10 | gzip > boot.img-ramdisk-cm10.gz
echo "Pack Sense boot.img"
./tools/mkbootimg --kernel Kernel/arch/arm/boot/zImage --ramdisk boot.img-ramdisk-sense.gz -o Sense/boot.img --base 13f00000
echo "Pack CM10 boot.img" 
./tools/mkbootimg --kernel Kernel/arch/arm/boot/zImage --ramdisk boot.img-ramdisk-cm10.gz -o CM10/boot.img --base 13f00000
echo "Done"
read ANS
