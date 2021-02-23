# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

SET(TOOLCHAIN_BIN_ROOT /home/malibushko/x-tools/i686-unknown-elf/bin) 
# specify the cross compiler
SET(CMAKE_C_COMPILER ${TOOLCHAIN_BIN_ROOT}/i686-unknown-elf-gcc)

SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_ROOT}/i686-unknown-elf-gcc)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_BIN_ROOT}/..)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

