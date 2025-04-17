mkdir build
cd build
cmake ${CMAKE_ARGS} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_VERBOSE_MAKEFILE=true \
      -DBUILD_TESTING=OFF \
      ..

make -j $CPU_COUNT
make install
