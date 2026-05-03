cmake ${CMAKE_ARGS} \
      -G Ninja \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_VERBOSE_MAKEFILE=true \
      -DBUILD_TESTING=OFF \
      -S . \
      -B build

cmake --build build
cmake --install build

# Separate debugging symbols on Linux
if [ -n "${OBJCOPY}" ]; then
  mkdir -p ${PREFIX}/lib/debug
  ${OBJCOPY} --only-keep-debug ${PREFIX}/bin/tango_admin ${PREFIX}/lib/debug/tango_admin.dbg
  chmod 664 ${PREFIX}/lib/debug/tango_admin.dbg
  ${OBJCOPY} --strip-debug ${PREFIX}/bin/tango_admin
  ${OBJCOPY} --add-gnu-debuglink=${PREFIX}/lib/debug/tango_admin.dbg ${PREFIX}/bin/tango_admin
fi
