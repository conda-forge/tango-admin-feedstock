setlocal EnableDelayedExpansion

cmake -G Ninja ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DBUILD_TESTING=OFF ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -S . ^
      -B build
if errorlevel 1 exit 1

cmake --build build
if errorlevel 1 exit

cmake --install build
if errorlevel 1 exit
