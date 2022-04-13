cd fashion_profile
rm -r build
mkdir build
rm main
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make
#rm main
cp main ../main
cd ..
./main

