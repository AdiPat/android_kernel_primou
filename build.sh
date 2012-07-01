echo "Start Compiling"
make clean mrproper
make titanium_defconfig 
make -j`grep 'processor' /proc/cpuinfo | wc -l`
./copy.sh 
echo "Done"
read ANS
