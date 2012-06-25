echo "Start Compiling"
make -j84 clean mrproper
make -j84 titanium_defconfig 
make -j84
./copy.sh 
echo "Done"
read ANS
