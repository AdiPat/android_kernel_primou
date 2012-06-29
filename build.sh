echo "Start Compiling"
make -j84 clean mrproper
make -j84 titanium_defconfig 
make -j110
./copy.sh 
echo "Done"
read ANS
